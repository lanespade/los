" Source System Defaults
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim
let skip_defaults_vim=1

" Fuzzy Search
set path+=**
set wildignore+=**/node_modules/**
set wildignore+=**/__*/**

" Plugin Manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
	Plug 'sheerun/vim-polyglot'
	Plug 'dense-analysis/ale'
call plug#end()

" ALE Settings 
let g:ale_linters = {}
let g:ale_linters.json = ['prettier']

let g:ale_fixers = {}
let g:ale_fixers['*'] = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers.json = ['prettier', 'eslint']

let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
