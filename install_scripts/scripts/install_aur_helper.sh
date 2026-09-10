#!/usr/bin/env bash
INSTALL_AUR_HELPER_SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$INSTALL_AUR_HELPER_SCRIPT_PATH/mini_functions.sh"

yay_aur_helper="aur.archlinux.org/yay-bin.git"
paru_aur_helper="aur.archlinux.org/paru-bin.git"

install_aur_helper() {
  # ask for user confirmation to install aur helper
  read -r -p "Do you want to install an AUR helper : Y/n " confirmation
  confirmation=${confirmation:-"Y"}

  if [[ "$confirmation" =~ ^[Yy]$ ]]; then
    local helper

    while true; do
      read -r -p "Which AUR helper you want to install : 1) yay 2) paru : " helper

      case "$helper" in
        1)
          repo_url="https://$yay_aur_helper"
          repo_name="$(get_basename "$yay_aur_helper")"
          bin_name="yay"
          break
          ;;
        2)
          repo_url="https://$paru_aur_helper"
          repo_name="$(get_basename "$paru_aur_helper")"
          bin_name="paru"
          break
          ;;
        *)
          warning "Invalid option. Please choose 1 or 2."
          ;;
      esac
    done

    # get into workstationdots
    cd "$HOME/workstationdots" || return

    # clone the repo if it doesn't exits
    if [[ ! -d "$repo_name" ]]; then
      git clone "$repo_url"
    else
      info "$repo_name already exists, skipping clone."
    fi

    # cd into the repo and pull the latest version
    cd "$repo_name" || return
    git pull

    # install the helper if it doesn't exist
    helper_path=$(command -v "$bin_name")
    if [[ -z "$helper_path" ]];then
      makepkg -si
    else
      info "Binary of $bin_name already exists"
    fi

  fi
}

# AUR helper
run_function install_aur_helper
