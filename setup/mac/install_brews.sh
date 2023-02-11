#!/bin/bash -e

# PC移行時

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew upgrade
brew update
export HOMEBREW_NO_AUTO_UPDATE=1

brew tap grpc/grpc

FORMULAE_LIBS='
  adns
  aom
  autoconf
  automake
  bdw-gc
  c-ares
  cairo
  cfitsio
  cfn-lint
  cocoapods
  coreutils
  direnv
  docbook
  docbook-xsl
  fftw
  flow-cli
  fontconfig
  fop
  freetype
  fribidi
  gcc
  gdbm
  gdk-pixbuf
  gettext
  ghostscript
  giflib
  git
  git-lfs
  git-secrets
  glib
  gmp
  gnu-getopt
  gnupg
  gnutls
  gobject-introspection
  golangci-lint
  graphite2
  grpc
  gtk+3
  guile
  hadolint
  harfbuzz
  hdf5
  helm
  hwloc
  http-server
  icu4c
  ilmbase
  imagemagick
  imath
  isl
  jbig2dec
  jemalloc
  jpeg
  jq
  k1LoW/tap/tbls
  libassuan
  libcroco
  libde265
  libev
  libevent
  libexif
  libffi
  libgcrypt
  libgpg-error
  libgsf
  libheif
  libidn
  libidn2
  libimagequant
  libksba
  liblqr
  libmatio
  libmpc
  libomp
  libpng
  libpthread-stubs
  librsvg
  libsodium
  libspng
  libssh
  libtasn1
  libtiff
  libtool
  libunistring
  libusb
  libx11
  libxau
  libxcb
  libxdmcp
  libxext
  libxml2
  libxrender
  libxslt
  libyaml
  little-cms2
  lua
  lzo
  m4
  memcached
  mesa
  mozjpeg
  mpdecimal
  mpfr
  mysql@5.7
  ncurses
  nettle
  nghttp2
  nodebrew
  nodenv
  npth
  nspr
  nss
  oniguruma
  opa
  open-mpi
  openexr
  openjpeg
  openslide
  openssl
  openssl@1.1
  orc
  p11-kit
  pango
  pcre
  pcre2
  pinentry
  pixman
  pkg-config
  poppler
  protobuf
  pyenv
  x265
  qt
  rbenv
  readline
  redis
  ruby-build
  saml2aws
  shared-mime-info
  shellcheck
  sqlite
  hudochenkov/sshpass/sshpass
  szip
  telnet
  tfenv
  the_silver_searcher
  tig
  tmux
  tree
  unbound
  unixodbc
  utf8proc
  vips
  webp
  wget
  xmlto
  xorgproto
  xz
  zstd
  aws/tap/copilot-cli
  c-bata/kube-prompt/kube-prompt
  koekeishiya/formulae/yabai
  koekeishiya/formulae/skhd
'

# TODO: google-chrome, iterm2 追加
CASK_LIBS='
  alfred
  android-studio
  atom
  blender
  chromedriver
  clipy
  discord
  docker
  dropbox
  flutter
  google-cloud-sdk
  jetbrains-toolbox
  kindle
  mi
  mysqlworkbench
  obs
  p4v
  sequel-ace
  skitch
  skype
  snowflake-snowsql
  sublime-text
  unity-hub
  visual-studio-code
  1password
'

for lib in $(echo "$FORMULAE_LIBS"); do
  echo "************"
  echo "install $lib"
  echo "************"
  brew install "$lib"
done



# for sdkmanager
brew install "openjdk@8"
sudo ln -sfn /usr/local/opt/openjdk\@8/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

for lib in $(echo "$CASK_LIBS"); do
  echo "************"
  echo "install $lib"
  echo "************"
  brew install --cask "$lib"
done

# brewのgoenvは古いのでgitからinstall
git clone https://github.com/syndbg/goenv.git ~/.goenv

# Pasword入力が求められるアプリ
sudo brew install --cask karabiner-elements
sudo brew install --cask zoom
sudo brew install --cask onedrive
sudo brew install --cask google-japanese-ime
sudo brew install --cask 1password/tap/1password-cli

