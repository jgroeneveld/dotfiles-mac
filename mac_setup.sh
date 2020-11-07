#!/usr/bin/env bash

# this sets defaults for the mac environment


# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &



# System
# ==============

# Set Login Window Text
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Moin!"

# Play iOS charging sound when MagSafe is connected.
defaults write com.apple.PowerChime ChimeOnAllHardware -bool true && \
open /System/Library/CoreServices/PowerChime.app


# Mail
# ===============
# Show Attachments as Icons

defaults write com.apple.mail DisableInlineAttachmentViewing -bool yes

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Safari
# ==============

#Enable Develop Menu and Web Inspector
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true && \
defaults write com.apple.Safari IncludeDevelopMenu -bool true && \
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true && \
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true && \
defaults write -g WebKitDeveloperExtras -bool true

# Disable hyperlink auditing beacon

defaults write com.apple.SafariTechnologyPreview com.apple.Safari.ContentPageGroupIdentifier.WebKit2HyperlinkAuditingEnabled -bool false

defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2HyperlinkAuditingEnabled -bool false

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Hide Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Hide Safari’s sidebar in Top Sites
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

# Warn about fraudulent websites
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Update extensions automatically
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

# TextEdit
# ==============

# Use Plain Text Mode as Default
defaults write com.apple.TextEdit RichText -int 0


# Finder
# ==============

# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show All File Extensions
defaults write -g AppleShowAllExtensions -bool true

# Adjust Number of Recent Places to 5
defaults write -g NSNavRecentPlacesLimit -int 5 && \
killall Finder

# Sets default save target to be a local disk, not iCloud.
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false

#Set Current Folder as Default Search Scope
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Set Sidebar Icon Size to 'medium'.
defaults write -g NSTableViewDefaultSizeMode -int 2

# Avoids creation of .DS_Store and AppleDouble files.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable Creation of Metadata Files on USB Volumes
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Hide all desktop icons because who need 'em'
defaults write com.apple.finder CreateDesktop -bool false

# Show Status Bar
defaults write com.apple.finder ShowStatusBar -bool true

# Show Full Path in Finder Title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Keyboard
# ==============

# Auto-Correct Enable (Default)
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool true
defaults write -g WebAutomaticTextReplacementEnabled -bool true


# Enable Key Repeat
defaults write -g ApplePressAndHoldEnabled -bool false

# Sets a very fast repeat rate, adjust to taste.
defaults write -g KeyRepeat -int 1

# Terminal & iTerm 2
# ==============

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false


# Dock
# ==============

# Improve hiding speed
defaults write com.apple.dock autohide-delay -float 0

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Set icon size
defaults write com.apple.dock tilesize -int 30

# Lock the Dock Size
defaults write com.apple.Dock size-immutable -bool yes && killall Dock


# Misc
# ==============

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Screenshots into a specfic folder
mkdir ~/Pictures/Screenshots
defaults write com.apple.screencapture location ~/Pictures/Screenshots

# Disable crsh reporter
defaults write com.apple.CrashReporter DialogType none

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
