#!/bin/bash -e
# PC移行時

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew upgrade
brew update
export HOMEBREW_NO_AUTO_UPDATE=1

FORMULAE_LIBS='
  adns
  aom
  autoconf
  automake
  bdw-gc
  c-ares
  cairo
  cfitsio
  cocoapods
  coreutils
  direnv
  docbook
  docbook-xsl
  fftw
  flow-cli
  fontconfig
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
  goenv
  graphite2
  guile
  hadolint
  harfbuzz
  hdf5
  helm
  hwloc
  icu4c
  ilmbase
  imagemagick
  imath
  isl
  jbig2dec
  jemalloc
  jpeg
  jq
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
  libyaml
  little-cms2
  lzo
  m4
  memcached
  mozjpeg
  mpdecimal
  mpfr
  mysql
  ncurses
  nettle
  nghttp2
  nodebrew
  npth
  nspr
  nss
  oniguruma
  opa
  open-mpi
  openexr
  openjdk
  openjpeg
  openslide
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
  shared-mime-info
  shellcheck
  sqlite
  szip
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
  c-bata/kube-prompt/kube-prompt
  koekeishiya/formulae/yabai
  koekeishiya/formulae/skhd
'

CASK_LIBS='chromedriver java sequel-ace'

for lib in $(echo "$FORMULAE_LIBS"); do
  echo "************"
  echo "install $lib"
  echo "************"
  brew install "$lib"
done

for lib in $(echo "$CASK_LIBS"); do
  echo "************"
  echo "install $lib"
  echo "************"
  brew install --cask "$lib"
done
