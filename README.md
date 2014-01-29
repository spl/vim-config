
Introduction
------------

This repository contains all the configuration files and scripts that I (Sean
Leather) use with Vim across various platforms.

Initialization
--------------

After first cloning this repository, you need to fetch the submodules. To do
this, run the following commands in the top-level directory of the repository.

    > git submodule update --init

Then, build the vimproc code by following their installation instructions.

Usage
-----

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

Submodules
----------

To add a new submodule, use the following command template:

    git submodule add <repository> vimfiles/bundle/<name>

When using GitHub, use the Git read-only option (`git://`) instead of the SSH
option (`git@`). If you own the submodule, it's better to clone the repository
elsewhere for updating it.

In `git status`, you will notice that `.gitmodules` has been updated and the
new directory has been created (as a "new file"). Commit these:

    git commit -m "Install <name> submodule"

