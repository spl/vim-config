# Introduction

This repository contains all the configuration files and scripts that I (Sean
Leather) use with Vim across various platforms.

# Usage

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

To add a new submodule as a bundle, use the following instructions.

1. Add the `git` submodule with this command (template):

   ```
   $ git submodule add <repository> vimfiles/bundle/<name>
   ```

   Always use `https://` for the repository protocol (and not `git@`) to avoid
   requiring authentication on hosts for which you don't have your SSH public
   key shared.

2. Commit the changed `.gitmodules` and the new `vimfiles/bundle` directory
   (which appears as a "new file")  with this command (template):

   ```
   $ git commit -m "Add <name> bundle"
   ```
