" System Defaults
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim
let skip_defaults_vim=1

" Basic Defaults
set nu
set hls
set number
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamed

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
	Plug 'ludovicchabant/vim-gutentags'
    Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
call plug#end()

" Gutentags
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', '.git']
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_extra_args = ['--tag-relative=yes', '--fields=+ailmnS']

" ALE Settings
let g:ale_fixers = {}
let g:ale_fixers['*'] = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers.javascript = ['prettier', 'eslint']
let g:ale_fixers.json = ['prettier']

let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1

" FZF
nnoremap <silent> <C-p> :FZF!<CR>
let g:fzf_preview_window = 'down:99%'

