#!/bin/bash -e

- Macのパスワード変更
- AppStoreからXCode install

# mac performance
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
defaults write -g com.apple.trackpad.scaling 7.0
defaults write -g com.apple.mouse.scaling 1.5
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.dock orientation -string 'right'

# 隠しファイル表示
defaults write com.apple.finder AppleShowAllFiles YES

# すべての拡張子表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# スマート引用符OFF
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# IPv6 OFF
sudo networksetup -setv6off Wi-Fi

# XCode
# sudo xcode-select --install (AppStore経由でinstallする)
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer

# return/agreeなどを求められる
sudo xcodebuild -runFirstLaunch

# TODO:
# - よく使う項目にホームを追加 (Finder -> 移動　-> /User -> ホームディレクトリをドロップ)
# - システム環境設定 -> ユーザとグループ -> 鍵マーククリック & ユーザの詳細オプション -> ログインシェルをbashに変更

# 設定後、再起動
