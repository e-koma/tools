#!/bin/bash -e

# mac performance
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
defaults write -g com.apple.trackpad.scaling 3
defaults write -g com.apple.mouse.scaling 1.5

# 隠しファイル表示
defaults write com.apple.finder AppleShowAllFiles YES

# IPv6 OFF
sudo networksetup -setv6off Wi-Fi

# XCode
sudo xcode-select --install
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch

sudo gem install cocoapods

# TODO:
# - よく使う項目にホームを追加 (Finder -> 移動　-> /User -> ホームディレクトリをドロップ)
# - Finderで.ファイルを表示するように (Finder -> 設定 -> 詳細 -> すべてのファイル名拡張子を表示)
# - キーボード -> ユーザ辞書 ->スマート引用符をOFF
# - システム環境設定 -> ユーザとグループ -> 鍵マーククリック & ユーザの詳細オプション -> ログインシェルをbashに変更
