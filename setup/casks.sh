#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_pending "Checking applications"
# ------------------------------------------------------------------------------

if has_command "brew cask"; then
  if ! has_app "Alacritty"; then
    get_consent "Install Alacritty.app"
    if has_consent; then
      e_pending "Installing Alacritty.app"
      brew cask install alacritty
      cp ../alacritty.yml ~/.alacritty.yml
      test_app "Alacritty"
    fi
  fi

  if ! has_app "Adobe Creative Cloud"; then
    get_consent "Install Adobe Creative Cloud.app"
    if has_consent; then
      e_pending "Installing adobe-creative-cloud"
      brew cask install adobe-creative-cloud
      test_app "Adobe Creative Cloud"
    fi
  fi

  if ! has_app "Google Chrome"; then
    get_consent "Install Google Chrome.app"
    if has_consent; then
      e_pending "Installing google-chrome"
      brew cask install google-chrome
      test_app "Google Chrome"
    fi
  fi

  if ! has_app "Firefox Developer Edition"; then
    get_consent "Install Firefox Developer Edition.app"
    if has_consent; then
      e_pending "Installing firefox-developer-edition"
      brew cask install firefox-developer-edition
      test_app "Firefox Developer Edition"
    fi
  fi

  if ! has_app "Spotify"; then
    get_consent "Install Spotify.app"
    if has_consent; then
      e_pending "Installing spotify"
      brew cask install spotify
      test_app "Spotify"
    fi
  fi


  if ! has_app "Visual Studio Code"; then
    get_consent "Install Visual Studio Code.app"
    if has_consent; then
      e_pending "Installing visual-studio-code"
      brew cask install visual-studio-code
      test_app "Visual Studio Code"
    fi
  fi
fi
