#!/usr/bin/env bash
set -euo pipefail

REPO_URL_WORKSTATION="https://github.com/bibjaw99/workstation"
DIR_DOTFILES="$HOME/.local/share/dotfiles"
DIR_GITHUB_PROJECTS="$HOME/github"
BASENAME_REPO_WORKSTATION=$(basename "$REPO_URL_WORKSTATION" .git)
DIR_PROJECT_WORKSTATION="$DIR_GITHUB_PROJECTS/$BASENAME_REPO_WORKSTATION"
DIR_INSTALL_SCRIPTS="$DIR_PROJECT_WORKSTATION/install_scripts"

mkdir -p "$(dirname "$DIR_DOTFILES")"

# Functions
info () {
  printf "\e[1;34m[INFO]\e[0m %s\n" "$*"
}

success () {
  printf "\e[1;32m[SUCCESS]\e[0m %s\n" "$*"
}

warning () {
  printf "\e[1;33m[WARNING]\e[0m %s\n" "$*"
}

error () {
  printf "\e[1;31m[ERROR]\e[0m %s\n" "$*" >&2
  exit 1
}

# Check if git  exists
if ! command -v git &>/dev/null; then
  warning "git is not installed !!"
  info "Installing git...."
  sudo pacman -Sy --noconfirm git < /dev/tty
fi

# Clone repo if needed
if [[ ! -d "$DIR_PROJECT_WORKSTATION" ]]; then
  info "Cloning $REPO_URL_WORKSTATION into $DIR_PROJECT_WORKSTATION"
  mkdir -p "$DIR_GITHUB_PROJECTS"
  git clone "$REPO_URL_WORKSTATION" "$DIR_PROJECT_WORKSTATION"
else
  info "Repo already exists at $DIR_PROJECT_WORKSTATION"
fi

# Copy dotfiles to the targetted directory 
if [[ -d "$DIR_DOTFILES" ]]; then
  warning "$DIR_DOTFILES already exists. Overwrite? [y/N]" > /dev/tty
  read -r confirm < /dev/tty
  if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    error "Aborted by user."
  fi
  rm -rf "$DIR_DOTFILES"
  cp -r "$DIR_PROJECT_WORKSTATION/dotfiles" "$DIR_DOTFILES"
  info "Copied and overwritten dotfiles. Skipping further install."
  exit 0
else
  cp -r "$DIR_PROJECT_WORKSTATION/dotfiles" "$DIR_DOTFILES"
  info "Copied dotfiles (fresh install). Proceeding with setup..."
fi

# Run installation scripts
run_script_if_exists() {
  local script="$1"
  local script_path="$DIR_INSTALL_SCRIPTS/$script"

  if [[ -f "$script_path" ]]; then
    info "Running $script..."
    (
      cd "$DIR_INSTALL_SCRIPTS"
      bash "./$script"
    )
  else
    info "$script not found, skipping."
  fi
}

run_script_if_exists "package_install.sh"
run_script_if_exists "flatpak_install.sh"
run_script_if_exists "symlink_configs.sh"
run_script_if_exists "symlink_files.sh"

success "✅ All done."
