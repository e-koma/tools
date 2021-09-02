#!/bin/bash -e

# mac performance
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
defaults write -g com.apple.trackpad.scaling 3
defaults write -g com.apple.mouse.scaling 1.5

# 隠しファイル表示
defaults write com.apple.finder AppleShowAllFiles YES

sudo xcode-select --install
