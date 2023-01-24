imap <special> jj <Esc>
inoremap kk <C-n>
inoremap ii <C-x>
inoremap jk <C-f> 
set path+=**

nnoremap j gj
nnoremap k gk


syntax enable
set fileformat=unix
set autoindent

set showcmd
set confirm

set number
set relativenumber

set tabstop=4 
set smarttab
set expandtab
set shiftwidth=4
set softtabstop=4
autocmd FileType make setlocal noexpandtab softtabstop=0
set list lcs=tab:->,space:.

set incsearch
set hlsearch
set ignorecase
set smartcase 

set cursorline
set cursorcolumn
set colorcolumn=80,160

nnoremap S :%s//g<Left><Left>
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

set scrolloff=5
set wildmenu

set formatoptions+=j   

let g:netrw_banner=0        " disable annoying banner

colorscheme koehler
