#!/bin/sh -e

# Symbolic link with force and don't follow existing link
LN="ln -nsf --"

# mkdir if the directory doesn't alread exist
MKDIR="mkdir -p --"

# Full directory path of script
SRC=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

# Update the submodules
git submodule sync > /dev/null
git submodule update --init

# Platform name
UNAME_S="$(uname -s)"

case "$UNAME_S" in
  Darwin)
    # Make user bin directory
    USER_BIN_DIR=$HOME/bin
    $MKDIR "$USER_BIN_DIR"
    $LN "$SRC/bin/macvim" "$USER_BIN_DIR/gvim"
    $LN "$SRC/bin/macvim" "$USER_BIN_DIR/gvimdiff"
    ;;
esac

case "$UNAME_S" in
  Linux|Darwin|FreeBSD|NetBSD|OpenBSD|DragonFly|SunOS)
    $LN "$SRC/vimfiles" "$HOME/.vim"
    $LN "$SRC/vimrc.vim" "$HOME/.vimrc"
    ;;
  *)
    echo "Oops! This platform is not currently supported."
    exit -1
    ;;
esac

make -C "$SRC/vimfiles/bundle/vimproc" > /dev/null
