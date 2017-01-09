
Introduction
------------

This repository contains all the configuration files and scripts that I (Sean
Leather) use with Vim across various platforms.

Initialization
--------------

After cloning this repository or updating it, you need to update the submodules.
To do this, run `make` in the top-level directory of the repository. This will
update the submodules and build the `vimproc` library.

Usage
-----

## Easy

Run the [`install.sh`](./install.sh) script.

## The Details

You should create the appropriate links to each of the files or directories in
this repository. The following files on the left should be linked to the
locations on the right.

`vimrc.vim`     - the primary configuration file
*  Mac, Unix:   `$HOME/.vimrc`
*  Win:         `$HOME/_vimrc`

`vimfiles`      - directory of Vim configuration files
*  Mac, Unix:   `$HOME/.vim`
*  Win:         `$HOME/vimfiles`

`bin/macvim`    - command-line script chooses `gvim` or `gvimdiff` for `MacVim`
*  Mac:         `$HOME/bin/gvim` *and* `$HOME/bin/gvimdiff`

### Submodules

To add a new submodule, use the following command template:

    git submodule add <repository> vimfiles/bundle/<name>

When using GitHub, use the Git read-only option (`git://`) instead of the SSH
option (`git@`). If you own the submodule, it's better to clone the repository
elsewhere for updating it.

In `git status`, you will notice that `.gitmodules` has been updated and the
new directory has been created (as a "new file"). Commit these:

    git commit -m "Install <name> submodule"

