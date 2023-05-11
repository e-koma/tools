#!/bin/bash -e

USER_NAME=yuto.komai

RUBY_VERSION=2.7.4
PYTHON39_VERSION=3.9.7
PYTHON38_VERSION=3.8.9
PYTHON37_VERSION=3.7.11
GO_VERSION=1.16.7
NODE_VERSION=16.8.0
TF1_VERSION=1.0.5
TF0_VERSION=0.14.5

function install_lang () {
  local env_command="$1"
  local version="$2"
  "$env_command" install "$version"
  "$env_command" global "$version"
  "$env_command" rehash

  echo "****************"
  echo " $env_command versions "
  echo "****************"
  "$env_command" versions
  source ~/.bash_profile
}

function check_version () {
  local language="$1"
  echo "****************"
  echo " $language version "
  echo "****************"

  case "$language" in
    go ) go version ;;
    * ) "$language" --version ;;
  esac
}

# Ruby
install_lang rbenv "$RUBY_VERSION"
check_version ruby
gem install bundler:1.16.3

# Python
install_lang pyenv "$PYTHON39_VERSION"
install_lang pyenv "$PYTHON37_VERSION"
install_lang pyenv "$PYTHON38_VERSION"
check_version python
pip install onelogin-aws-cli

# Go
install_lang goenv "$GO_VERSION"
check_version go
export GOENV_DISABLE_GOPATH=1
go env GOPATH

# Node
install_lang nodenv "$NODE_VERSION"
check_version node
npm install --global yarn

# Terraform
tfenv install "$TF0_VERSION"
tfenv install "$TF1_VERSION"
tfenv use "$TF0_VERSION"
tfenv list

# Erlang / Elixir
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1
source ~/.bash_profile
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf install
asdf current

# 選択を求められる
# Rust/Cargo
curl https://sh.rustup.rs -sSf | sh
. "$HOME/.cargo/env"
cargo install typos-cli

# ここから先、パスワードが求められる
# aws-cli
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
rm "AWSCLIV2.pkg"

# session manager plugin
curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/mac/sessionmanager-bundle.zip" -o "sessionmanager-bundle.zip"
unzip sessionmanager-bundle.zip
sudo ./sessionmanager-bundle/install -i /usr/local/sessionmanagerplugin -b /usr/local/bin/session-manager-plugin
rm "sessionmanager-bundle.zip"

# gcloud
https://cloud.google.com/sdk/docs/install

gcloud components install gke-gcloud-auth-plugin

# cloudsql proxy
https://cloud.google.com/sql/docs/mysql/connect-auth-proxy?hl=ja#mac-m1

# Cocoapods
sudo gem install cocoapods

# 同意を求められる
# Flutter
flutter doctor --android-licenses

# kubesec
curl -sSL https://github.com/shyiko/kubesec/releases/download/0.9.2/kubesec-0.9.2-darwin-amd64 \
  -o kubesec && chmod a+x kubesec && sudo mv kubesec /usr/local/bin/
