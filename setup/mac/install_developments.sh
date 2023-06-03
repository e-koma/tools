#!/bin/bash -e

# asdf plugin list
# asdf plugin update --all
# asdf list all python

asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin-add python
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin-add flutter
asdf plugin add tfenv https://github.com/carlduevel/asdf-tfenv.git
asdf plugin add terraform
asdf plugin-add rust https://github.com/asdf-community/asdf-rust.git


for v in 3.7.16 3.8.16 3.9.16; do
  asdf install python "$v"
  asdf global python "$v"
  pip install onelogin-aws-cli
done

asdf install golang 1.20.4
asdf global golang 1.20.4

asdf install nodejs 16.20.0
asdf install nodejs 18.16.0
asdf install nodejs 20.2.0
asdf global nodejs 20.2.0

asdf install ruby 2.7.8
asdf install ruby 3.0.6
asdf global ruby 2.7.8
sudo gem install bundler:1.16.3
# Cocoapods
sudo gem install cocoapods

asdf install rust 1.69.0
asdf global rust 1.69.0
cargo install typos-cli

asdf install flutter 3.10.3-stable
asdf global flutter 3.10.3-stable

asdf install terraform 1.4.6
asdf global terraform 1.4.6

# Go
export GOENV_DISABLE_GOPATH=1
go env GOPATH

# Node
npm install --global yarn

# Erlang / Elixir


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

# kubesec
https://github.com/tk3fftk/kubesec/releases
sudo mv kubesec /usr/local/bin/
