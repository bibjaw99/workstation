#!/usr/bin/env bash

# ===================================================================================
# get the base name of a path
get_basename() {
  local dir="${1%/}"
  basename "$dir" .git
}

# get the directory path
get_dirname() {
  local dir="${1%/}"
  dirname "$dir"
}

# ===================================================================================
# messages
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

# ===================================================================================
# script separator
separation() {
  printf "\n"
  printf "%s\n" "======================================================================"
  printf "\n"
}

# caller funtion
run_function() {
  "$@" || return 1
  separation
}
