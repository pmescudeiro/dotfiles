" ------------------------------------------------------------------------
" CONFIG -----------------------------------------------------------------
" ------------------------------------------------------------------------
" [Adapted from: freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor,
" stackoverflow.com/a/3682602, & chengcheng-xiao.github.io/post/2022/09/12/vim_config.html]

" Turn syntax highlighting on.
syntax on

" Set colorscheme.
colorscheme monokai

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Add numbers to each line on the left-hand side.
set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Shorten updatetime (default is 4000 ms = 4 s).
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use tabs instead of space characters.
set noexpandtab

" Set automatic indentation.
set autoindent

" Do not wrap lines. Allow long lines to extend as far as the line goes.
" set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show matching words during a search.
set showmatch

" Fix for vim theme color rendering with kitty terminal emulator
" [See: github.com/kovidgoyal/kitty/issues/108#issuecomment-320492663
" and unix.stackexchange.com/a/615451]:
let &t_ut=''

" ------------------------------------------------------------------------
" VIMSCRIPT --------------------------------------------------------------
" ------------------------------------------------------------------------

" Always start vim in insert mode
" [See: stackoverflow.com/a/11464166]:
" autocmd BufRead,BufNewFile * start

" Automatically create shebangs
" [See: vim.fandom.com/wiki/Shebang_line_automatically_generated]:
augroup Shebang
	autocmd BufNewFile *.py 0put =\"#!/usr/local/bin/python3.9\<nl># -*- coding: utf-8 -*-\<nl>\"|$
	autocmd BufNewFile *.sh 0put =\"#!/bin/bash\<nl>\"|$
augroup END

" Function to toggle spellcheck
" [Adapted from: stackoverflow.com/a/20579322].
let s:enabled = 0
function! ToggleSpellcheck()
	if s:enabled
		:set nospell
		let s:enabled = 0
	else
		:setlocal spell spelllang=en_us
		let s:enabled = 1
	endif
endfunction

" ------------------------------------------------------------------------
" MAPPINGS ---------------------------------------------------------------
" ------------------------------------------------------------------------

" Copy and paste to/from clipboard.
" [NOTE: vim-gtk must be installed.]
" from: vim.fandom.com/wiki/Accessing_the_system_clipboard.
inoremap <C-v> <Esc>"+pa
vnoremap <C-c> "+y
vnoremap <C-x> "+d

" Select all.
nnoremap <C-a> ggVG
inoremap <C-a> <Esc> ggVG
vnoremap <C-a> <Esc> ggVG

" Delete selected text with backspace in visual mode.
vnoremap <BS> d

" Save document.
" Adapted from: stackoverflow.com/a/31932467.
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
vnoremap <C-s> <Esc>:w<CR>

" Quit vim.
nnoremap <C-q> :q!<CR>
inoremap <C-q> <Esc>:q!<CR>
vnoremap <C-q> <Esc>:q!<CR>

" Toggle spellcheck.
nnoremap <F6> :call ToggleSpellcheck()<CR>

" Highlight cursor line underneath the cursor vertically.
nnoremap <C-l> :set cursorcolumn!<CR>
inoremap <C-l> <Esc> :set cursorcolumn!<CR>
vnoremap <C-l> <Esc> :set cursorcolumn!<CR>

" Scrolling.
nnoremap <C-Up> <C-y>
nnoremap <C-Down> <C-e>
inoremap <C-Up> <C-x><C-y>
inoremap <C-Down> <C-x><C-e>

" Jump between paragraphs.
nnoremap <S-Up> {
nnoremap <S-Down> }
inoremap <S-Up> <C-o>{
inoremap <S-Down> <C-o>}

" Toggle comments.
noremap <C-k> :Commentary<CR>

" ------------------------------------------------------------------------
" PLUGINS ----------------------------------------------------------------
" ------------------------------------------------------------------------

call plug#begin()

" Collection of language packs for Vim.
Plug 'sheerun/vim-polyglot'

" Python PEP8 identation.
Plug 'Vimjas/vim-python-pep8-indent'

" Vim binding to the autocompletion library Jedi.
Plug 'davidhalter/jedi-vim'

" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'

" Syntax checking and semantic error highlighting.
Plug 'dense-analysis/ale'

" Commentaries.
Plug 'tpope/vim-commentary'

" Initialize plugin system
call plug#end()

" ------------------------------------------------------------------------
" ------------------------------------------------------------------------
" ------------------------------------------------------------------------
