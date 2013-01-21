
Introduction
------------

This repository contains all the configuration files and scripts that I (Sean
Leather) use with Vim across various platforms.

Initialization
--------------

After first cloning this repository, you need to fetch the submodules. To do
this, run the following commands in the top-level directory of the repository.

    > git submodule init
    > git submodule update

Usage
-----

You should create the appropriate links to each of the files or directories in
this repository. The following files on the left should be linked to the
locations on the right.

`vimrc.vim`     - the primary configuration file
*  Mac, Unix:   `$HOME/.vimrc`
*  Win:         `$HOME/_vimrc`

`cfg`           - directory of Vim configuration files
*  Mac, Unix:   `$HOME/.vim`
*  Win:         `$HOME/vimfiles`

`bin/macvim`    - command-line script chooses `gvim` or `gvimdiff` for `MacVim`
*  Mac:         `$HOME/bin/gvim` *and* `$HOME/bin/gvimdiff`

