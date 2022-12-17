let g:python3_host_prog='/usr/local/bin/python3'
let g:loaded_ruby_provider=0
let g:loaded_perl_provider=0

" ==========
" Plugins
" ==========


call plug#begin('~/.vim/plugged')


" Collection of Color schemes
Plug 'rafi/awesome-vim-colorschemes'
Plug 'wellle/targets.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'ap/vim-buftabline'
Plug 'roman/golden-ratio'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'andymass/vim-matchup'
Plug 'vim-scripts/indentpython'
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
" Plug 'preservim/vim-markdown'
" Plug 'godlygeek/tabular'      " needed by preservim/vim-markdown
" Plug 'epwalsh/obsidian.nvim'


call plug#end() 


" Use the colorscheme
colorscheme elflord



" Prevent a user from using arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> :prev<CR>
noremap <Right> :next<CR>

" set clipboard^=unnamed

" next/previous file
nmap <C-+> :next
nmap <C--> :prev

nnoremap <C-j> :tabprev<CR>
nnoremap <C-k> :tabnext<CR>
nnoremap <C-h> <C-w>h   " to left tab
nnoremap <C-l> <C-w>l   " to right tab


"  new split should appear below or right
set splitbelow
set splitright
set fillchars=|

" Default leader key is '\'
" NERDTree:
let NERDTreeShowHidden=1   		" always show hidden files 
let NERDTreeQuitOnOpen=1   		" close tree when opening file
map <Leader>n :NERDTreeFind<CR>		" open tree.  

" FZF 
" Open files on enter in new tab
let g:fzf_action = {
	\ 'enter': 'tab split',
	\ 'ctrl-x': 'split',
	\ 'ctrl-v': 'vsplit' }

" mapping for most used command 
let g:fzf_layout = { 'down': '~40%' }
nnoremap <Leader><Leader> :Files<cr>

" Enter turns off highlight
nnoremap <CR> :nohl<CR>

" (un)indent
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >
vnoremap <S-Tab> <

set expandtab    " spaces instead of tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2 " num spaces to use when using shifting '<' and '>'
set textwidth=80 " auto-break long lines 
set autoindent   " copy indent from previous line on 'Enter'

au BufNewFile,BufRead *.py
	 \set tabstop=4
	 \set softtabstop=4
	 \set shiftwidth=4

let g:ale_linters = {
	\ 'python': ['flake8','pylint'],
	\ 'javascript': ['esllint'],
	\ 'typescript': ['tsserver', 'tslint'],
	\ 'vue': ['eslint'],
	\ 'ruby': ['standardrb']
	\}

let g:ale_fixers = {
	\ 'python': ['yapf'],
	\ 'javascript': ['esllint'],
	\ 'typescript': ['tsserver', 'tslint'],
	\ 'vue': ['eslint'],
	\ 'scss': ['prettier'],
	\ 'html': ['prettier'],
	\ 'reason': ['refmt'],
	\ 'ruby': ['standardrb']
	\}
let g:ale_fix_on_save = 1


