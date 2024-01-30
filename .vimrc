" Color Schemes and Themes
set t_Co=256
set background=dark
set autoread
set nocompatible
colorscheme toast
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
let g:airline_theme='deus'
let g:airline_section_y = ''
let g:airline_section_z = '(%l,%c)'

" Basic Vim Settings
set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a

" NERDTree Keybindings
" <C-t> refers to <control+t>
nnoremap <C-t> :NERDTreeToggle<CR>
" Window Navigation with Ctrl-[hjkl]
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-w>l

" Fuzzy finder keybindings
let g:mapleader = ","
nmap <leader>ff :Files<CR>
" To run current file as an executable
nmap <leader>l :!clear&&./%<CR>
" To save current file as an executable
nmap <leader>m :w \| :e <CR>:!chmod +x %<CR><CR>
" To save file
nmap <leader>s :w<CR>
" To save file and quit
nmap <leader>q :wq<CR><CR>
" Open cheatsheet
nmap <leader>h :split /pub60/prajwal/.helper.md<CR>

" Plugins
call plug#begin()
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/vim-airline/vim-airline-themes' " Stats bar themes
Plug 'https://github.com/preservim/nerdtree' " File view
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'junegunn/fzf', { 'do': { -> fzf#install -all } } | Plug 'junegunn/fzf.vim'
set encoding=UTF-8
call plug#end()
" Plugins End

" Open NERDTree if there is no file on the command line
function! NTonStartup()
	if 0 == argc()
		NERDTree
	end
endfunction
autocmd VimEnter * call NTonStartup()
