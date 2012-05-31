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

" Load doc tags from bundles
Helptags

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
" Detect file types
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup filetypedetect

" File types
au BufNewFile,BufRead *.jak             setf java " Jak
au BufNewFile,BufRead *.vpp,*.sv,*.svpp setf verilog
au BufNewFile,BufRead *.flex,*.jflex    setf jflex
au BufNewFile,BufRead *.yacc            setf yacc
au BufNewFile,BufRead *.ghs             setf haskell " Generic Haskell
au BufNewFile,BufRead *.lagda           setf lhaskell " Literate Agda

" Compiler
"au BufEnter *.hs,*.lhs                  compiler ghc

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
" Completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Insert mode completion: always show menu and extra information
set completeopt=menuone,preview

" Disable AutoComplPop: automatically opening popup menu for completions
let g:acp_enableAtStartup=0

" Enable neocomplcache
let g:neocomplcache_enable_at_startup=1

" Do not ignore the case in the input
let g:neocomplcache_enable_smart_case=1

" Disable automatic completion. Use <C-x><C-u>
let g:neocomplcache_disable_auto_complete=1

" A function for the key maps below
function! s:check_back_space()"{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction"}}

" Map <C-d> in insert mode to do completion
inoremap <expr> <C-d> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<C-d>" : "\<C-x>\<C-u>"

" Map <Tab> in insert mode to go to next completion option
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

