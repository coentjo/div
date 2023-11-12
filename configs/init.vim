let g:python3_host_prog='/usr/local/bin/python3'
let g:loaded_ruby_provider=0
let g:loaded_perl_provider=0

" to remove ^M:    :%s/\(.\)\r/\1/

" this config file is in git repo:
" https://github.com/coentjo/div.git

" ==========
" Plugins
" ==========

"To install vim-plug:  
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 
" :PlugStatus to get an overview of the Plug status
 
"

" Using Vimscript to install some Plugins
call plug#begin('~/.vim/plugged') 

" lua << EOF "
" vim.fn['plug#begin']() "
" local Plug = vim.fn['plug#'](args) "
" Plug  'quarto-dev/quarto-nvim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'wellle/targets.vim'
" Plug 'nvim-treesitter/nvim-treesitter'
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
Plug 'godlygeek/tabular'      " needed by preservim/vim-markdown "
Plug 'preservim/vim-markdown'
" Plug 'epwalsh/obsidian.nvim'  "
Plug  'MunifTanjim/nui.nvim'   " needed by Plug  'jackMort/ChatGPT.nvim' "
Plug  'nvim-lua/plenary.nvim'   " needed by Plug  'jackMort/ChatGPT.nvim' "
Plug  'nvim-telescope/telescope.nvim'   " needed by Plug  'jackMort/ChatGPT.nvim' "
Plug  'chrisbra/unicode.vim'
Plug  'EVODelavega/vim-eazy-timer'
Plug  'voldikss/vim-floaterm'
" Plug  'quarto-dev/quarto-nvim'
" Plug  'jackMort/ChatGPT.nvim'

" vim.fn['plug#end']() "
" EOF "
call plug#end() 


" Using Lua to install some more

"lua << EOF
  "vim.fn['plug#begin']()
  "local Plug = vim.fn['plug#'](args)
  "Plug('preservim/vim-markdown')
  "vim.fn['plug#end']()
"EOF


" Use the colorscheme "
colorscheme elflord

" local tbl = {1, 2, 3}"
" for k, v in ipairs(tbl) do"
"   print(v)"
" end"
lua << EOF
print("Hey Coen, I'm using .config/nvim/init.vim")
EOF


" Prevent a user from using arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> :prev<CR>
noremap <Right> :next<CR>

set clipboard=unnamed

" next/previous file
nmap <C-+> :next
nmap <C--> :prev

nnoremap <C-j> :tabprev<CR>
nnoremap <C-k> :tabnext<CR>
nnoremap <C-h> <C-w>h   " to left tab
nnoremap <C-l> <C-w>l   " to right tab

" go file
:map gf :tabe <cfile><CR>


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

nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

noremap <F5> :w !python3 %<CR>
inoremap <F5> <ESC>:w !python3 %<CR>
noremap <F6> :w !quarto render --to pdf <CR>
inoremap <F6> :w !quarto render --to pdf <CR>

set rtp+=/usr/local/opt/fzf
