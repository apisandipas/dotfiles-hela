#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_pending "Creating summary"
# ------------------------------------------------------------------------------

echo "\r"

e_success "Default commands"
if has_path "Code"; then
  e_success "~/Code"
else
  e_failure "~/Code"
fi
test_command "xcode-select"
test_command "brew"
test_command "trash"
test_command "git"
test_command "zsh"
test_path ".oh-my-zsh"
test_brew "powerlevel10k"
test_command "node"
test_command "nvm"
test_command "yarn"
test_command "npm"
test_command "serve"
test_command "eslint"
test_command "prettier"
test_app "Adobe Creative Cloud"
test_app "Firefox Developer Edition"
test_app "Google Chrome"
test_app "Spotify"
test_app "Visual Studio Code"
e_success "Optimization commands"

echo "\r"

e_settled "Installation complete!"
