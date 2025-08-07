#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/bibjaw99/workstation"
TARGET_DIR="$HOME/.local/share/dotfiles"
GITHUB_PROJECT_DIR="$HOME/github"
REPO_NAME=$(basename "$REPO_URL" .git)
CLONE_DIR="$GITHUB_PROJECT_DIR/$REPO_NAME"
INSTALL_SCRIPT_DIR="$CLONE_DIR/install_scripts"

# ───── Functions ─────
error() {
  echo "❌ $1" >&2
  exit 1
}

info() {
  echo "📦 $1"
}

# ───── Check for git ─────
if ! command -v git &>/dev/null; then
  error "git is not installed. Please install it and retry."
fi

# ───── Clone repo if needed ─────
if [[ ! -d "$CLONE_DIR" ]]; then
  info "Cloning $REPO_URL into $CLONE_DIR"
  mkdir -p "$GITHUB_PROJECT_DIR"
  git clone "$REPO_URL" "$CLONE_DIR"
else
  info "Repo already exists at $CLONE_DIR"
fi

# ───── Copy dotfiles directory ─────
if [[ -d "$TARGET_DIR" ]]; then
  echo "⚠️  $TARGET_DIR already exists. Overwrite? [y/N]" > /dev/tty
  read -r confirm < /dev/tty
  if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    error "Aborted by user."
  fi
  rm -rf "$TARGET_DIR"
  cp -r "$CLONE_DIR/dotfiles" "$TARGET_DIR"
  info "Copied and overwritten dotfiles. Skipping further install."
  exit 0
else
  cp -r "$CLONE_DIR/dotfiles" "$TARGET_DIR"
  info "Copied dotfiles (fresh install). Proceeding with setup..."
fi

# ───── Run installation scripts ─────
run_script_if_exists() {
  local script="$1"
  local script_path="$INSTALL_SCRIPT_DIR/$script"

  if [[ -f "$script_path" ]]; then
    info "Running $script..."
    (
      cd "$INSTALL_SCRIPT_DIR"
      bash "./$script"
    )
  else
    info "$script not found, skipping."
  fi
}

run_script_if_exists "package_install.sh"
run_script_if_exists "symlink_configs.sh"
run_script_if_exists "symlink_files.sh"

info "✅ All done."
