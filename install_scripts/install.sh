#!/usr/bin/env bash
set -euo pipefail

repo_url_workstation="https://github.com/bibjaw99/workstation"
dir_dotfiles="$HOME/.local/share/dotfiles"
dir_github_projects="$HOME/github"
basename_repo_workstation=$(basename "$repo_url_workstation" .git)
dir_project_workstation="$dir_github_projects/$basename_repo_workstation"
dir_install_scripts="$dir_project_workstation/install_scripts"

mkdir -p "$(dirname "$dir_dotfiles")"

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
if [[ ! -d "$dir_project_workstation" ]]; then
  info "Cloning $repo_url_workstation into $dir_project_workstation"
  mkdir -p "$dir_github_projects"
  git clone "$repo_url_workstation" "$dir_project_workstation"
else
  info "Repo already exists at $dir_project_workstation"
fi

# Copy dotfiles to the targetted directory 
if [[ -d "$dir_dotfiles" ]]; then
  warning "$dir_dotfiles already exists. Overwrite? [y/N]" > /dev/tty
  read -r confirm < /dev/tty
  if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    error "Aborted by user."
  fi
  rm -rf "$dir_dotfiles"
  cp -r "$dir_project_workstation/dotfiles" "$dir_dotfiles"
  info "Copied and overwritten dotfiles. Skipping further install."
  exit 0
else
  cp -r "$dir_project_workstation/dotfiles" "$dir_dotfiles"
  info "Copied dotfiles (fresh install). Proceeding with setup..."
fi

# Run installation scripts
run_script_if_exists() {
  local script="$1"
  local script_path="$dir_install_scripts/$script"

  if [[ -f "$script_path" ]]; then
    info "Running $script..."
    (
      cd "$dir_install_scripts"
      bash "./$script"
    )
  else
    info "$script not found, skipping."
  fi
}

run_script_if_exists "package_install.sh"
run_script_if_exists "symlink_configs.sh"
run_script_if_exists "symlink_files.sh"

success "✅ All done."
