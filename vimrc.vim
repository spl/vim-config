""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is the primary local configuration file for Vim.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" First thing's first: I want Vim, not vi.
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Pathogen should be started before 'filetype'

" Install
runtime bundle/pathogen/autoload/pathogen.vim

" Start
call pathogen#infect()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set noguipty " Disable pseudo-tty

syntax on " Turn on syntax highlighting
filetype plugin indent on " Detect file types with plugins and indentation

set number    " Show line numbers on the left
set showmode  " Show current mode (INSERT, REPLACE, or VISUAL) on command line
set showcmd   " Show the command in the status line
set ruler     " Show line and column number of cursor at the bottom
set nowrap    " Don't wrap lines longer than the given window width - I hate that!

set background=light " Use a lighter background. Better for the eyes?

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set incsearch  " Use incremental search
set hlsearch   " Highlight search patterns in the text

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nojoinspaces  " Don't insert extra spaces after punctuation
set backspace=2   " Allow backspacing over everything in insert mode
set textwidth=80  " Wrap lines in insert mode

" Tabs and indent
set tabstop=8     " Number of spaces for a <Tab>
set shiftwidth=2  " Number of spaces for an indent
set expandtab     " I don't like tabs, so put spaces in their place.

set visualbell    " Don't beep at me!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Font
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("gui_running")
  if has("win32")
    set guifont=Lucida_Console:h9:
  endif
  if has("gui_macvim")
    set guifont=DejaVu\ Sans\ Mono:h12
  endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" haskell_doc.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" This module causes problems, so these are disabled for now.

"let g:haddock_browser = "open"
"let g:haddock_browser_callformat = "%s file://%s"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" matchit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable % to work on more than just braces/brackets
source $VIMRUNTIME/macros/matchit.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"autocmd BufReadPost * if exists("b:current_syntax")
"autocmd BufReadPost *   if b:current_syntax == "verilog"
"autocmd BufReadPost *   endif
"autocmd BufReadPost *   if b:current_syntax == "c"
"autocmd BufReadPost *      set cindent
"autocmd BufReadPost *   endif
"autocmd BufReadPost *   if b:current_syntax == "cpp"
"autocmd BufReadPost *      set cindent
"autocmd BufReadPost *   endif
"autocmd BufReadPost *   if b:current_syntax == "java"
"autocmd BufReadPost *      set cindent
"autocmd BufReadPost *   endif
"autocmd BufReadPost * endif

augroup filetypedetect

" Jak
au BufNewFile,BufRead *.jak             setf java

" VPP and SystemVerilog
au BufNewFile,BufRead *.vpp,*.sv,*.svpp setf verilog

" JFlex
au BufNewFile,BufRead *.flex,*.jflex    setf jflex

" YACC
au BufNewFile,BufRead *.yacc            setf yacc

" Generic Haskell
au BufNewFile,BufRead *.ghs             setf haskell

" Literate Agda to Literate Haskell
au BufNewFile,BufRead *.lagda           setf lhaskell

" Set ghc as compiler for Haskell files
au BufEnter *.hs                        compiler ghc

augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Format the current paragraph (based on formatoptions) and leave the cursor
" where it is. I forget where the use of CTRL-J came from, but it's stuck in my
" head, so why not live with it?
map <C-J> gwap

" Same as gwap, except only do the lines from the cursor position to the end of
" the paragraph.
map <C-K> gw}

