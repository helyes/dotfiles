#!/usr/bin/env bash

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# Set fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int  2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Save screenshots to ~/Desktop/1screenshot - so folder will be on the top oof the list
[ ! -d "~/Desktop/1screenshot" ] && mkdir ~/Desktop/1screenshot
defaults write com.apple.screencapture location -string "${HOME}/Desktop/1screenshot"

# Save space with jpg
defaults write com.apple.screencapture type -string "jpg"

# Disable shadow in screenshots (killall SystemUIServer) + image size will be accurate
defaults write com.apple.screencapture disable-shadow -bool true

# Enable subpixel font rendering on non-Apple LCDs
# Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
defaults write NSGlobalDomain AppleFontSmoothing -int 1


# Enable HiDPI display modes (requires restart)
# https://www.tekrevue.com/tip/hidpi-mode-os-x/
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

#Finder

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Make spring loading on directories faster (defaul 0.5)
defaults write NSGlobalDomain com.apple.springing.delay -float 0.1

# Disable .DS_Store files on usb drives 
# http://osxdaily.com/2009/12/31/what-is-a-ds_store-file/
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Expand the following File Info panes:
# "Name", “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true \
    Name -bool true

# https://github.com/mathiasbynens/dotfiles/blob/master/.macos


