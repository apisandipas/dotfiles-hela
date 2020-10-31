#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_pending "Running optimizations"
# ------------------------------------------------------------------------------

if has_command "brew"; then
  e_pending "Optimizing Homebrew"
  brew update && brew upgrade && brew doctor && brew cleanup
fi


get_consent "Re-sort Launchpad applications"
if has_consent; then
  e_pending "Re-sorting Launchpad applications"
  defaults write com.apple.dock ResetLaunchPad -boolean true
  killall Dock
fi

