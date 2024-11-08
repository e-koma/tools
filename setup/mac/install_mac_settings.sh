#!/bin/bash -e

- Macのパスワード変更
- AppStoreからXCode install

# bash
chsh -s /bin/bash

# Rosetta
softwareupdate --install-rosetta --agree-to-license

# Speed
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
defaults write -g com.apple.trackpad.scaling 10.0
defaults write -g com.apple.mouse.scaling 10.0

# Dock位置
defaults write com.apple.dock orientation -string 'right'

# 隠しファイル表示
defaults write com.apple.finder AppleShowAllFiles YES

# すべての拡張子表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# スマート引用符OFF
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# タップでクリック
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# ナチュラルなスクロール
defaults write -g com.apple.swipescrolldirection -bool false

# DS_Storeを作らせない
defaults write com.apple.desktopservices DSDontWriteNetworkStores True

# IPv6 OFF
sudo networksetup -setv6off Wi-Fi

# XCode
# sudo xcode-select --install (AppStore経由でinstallする)
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer

# return/agreeなどを求められる
sudo xcodebuild -runFirstLaunch

sudo xcodebuild -license

# TODO:
# - よく使う項目にホームを追加 (Finder -> 移動　-> /User -> ホームディレクトリをドロップ)
# - システム環境設定 -> ユーザとグループ -> 鍵マーククリック & ユーザの詳細オプション -> ログインシェルをbashに変更
# - CapsLock -> Control (default KeyboardとKarabiner Keyboardの両方必要)

# 設定後、再起動
