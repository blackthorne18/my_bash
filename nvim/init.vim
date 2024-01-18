" Color Schemes and Themes
set t_Co=256
set background=dark
set autoread
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
nnoremap <leader>ff <cmd>Telescope find_files<cr>
" To run current file as an executable
nmap <leader>l :w<CR>:!./%<CR>
" To save current file as an executable
nmap <leader>m :w \| :e <CR>:!chmod +x %<CR>
" To save file
nmap <leader>s :w<CR>
" To save file and quit
nmap <leader>q :wq<CR>
" Open cheatsheet
nmap <leader>h :split /Users/prajwalbharadwaj/.config/nvim/helper.md<CR>


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
Plug 'nvim-lua/plenary.nvim' " Fuzzy finding files requirements
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' } " Fuzzy file finder
Plug 'https://github.com/burntsushi/ripgrep' " Dependencies for telescope
Plug 'https://github.com/sharkdp/fd' " Dependencies for telescope
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Better syntax highlighter
set encoding=UTF-8
call plug#end()
" Plugins End


" Because tree sitter is configured in lua, we have to add the following lines
" to execute lua from within vim
function! SetupTreeSitter()
lua << EOF
	require'nvim-treesitter.configs'.setup {
			-- A list of parser names, or "all" (the five listed parsers should always be installed)
			ensure_installed = { "python", "bash", "c", "lua", "vim", "vimdoc", "query" },
			auto_install = true,
			highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	}
EOF
endfunction
" call SetupTreeSitter()


