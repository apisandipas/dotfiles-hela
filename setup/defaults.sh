#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_pending "Creating defaults"
# ------------------------------------------------------------------------------

# Close any open settings panels
osascript -e 'tell application "System Preferences" to quit'

# Set computer name (as done via System Preferences → Sharing)
e_pending "Setting hostname"
sudo scutil --set ComputerName "$COMPUTER_NAME"
sudo scutil --set HostName "$HOST_NAME"
sudo scutil --set LocalHostName "$HOST_NAME"
# defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$HOST_NAME"

e_pending "Creating Dock spacers..."
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
killall Dock

e_pending "Autohiding Dock..."
defaults write com.apple.dock autohide -boolean true
killall Dock

#e_pending "Setting wallpaper.."
#osascript -e 'tell application "Finder" to set desktop picture to POSIX file "$DOTS_DIR/wallpaper/keebs.png"'

e_pending "Displaying hidden Finder files/folders"
defaults write com.apple.finder AppleShowAllFiles -boolean true
killall Finder

if ! has_path "Code"; then
  e_pending "Creating ~/Code folder"
  mkdir -p ~/Code
  test_path "Code"
fi

if ! has_command "xcode-select"; then
  e_pending "Installing xcode-select (CLI tools)"
  xcode-select --install
  test_command "xcode-select"
fi

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Trackpad: map bottom right corner to right-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

 # Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Position dock on the left side of the screen
defaults write com.apple.dock orientation -string "left"

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
