" GENERAL
    " set leader key
        let mapleader=","

    " no annoying sound
        set visualbell

    " enable syntax processing
        syntax enable

    " no legacy stuff
        set nocompatible

    " Show partial commands in the last line of the screen
        set showcmd

    " ask for confirmation instead of failing command
        set confirm

    " persistent undos [4]
        set undodir=~/.config/nvim/undodir
        set undofile

    " fix: vim gtk [4]
        set clipboard=unnamedplus

    " Delete comment character when joining commented lines [4]
        set formatoptions+=j   
    " Stop newline continution of comments
        set formatoptions-=cro                  

    " dash separated words are treated as word text object
        set iskeyword+=-

    " files
        set fileformat=unix

    " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
        au! BufWritePost $MYVIMRC source %

    " open my vimnotes
        nnoremap <Leader>hhh :tabedit ~/auto-setup/nvim/notes.md<CR>
        nnoremap <Leader>init :tabedit ~/auto-setup/nvim/init.vim<CR>
        
" MOVEMENT
    " remap escape
        inoremap jj <esc>
        inoremap Jk <esc>

    " remap autocomplete
        inoremap kk <C-n>
        inoremap ii <C-x>
        inoremap jk <C-f> 

    " moves lines around [2]
        nnoremap <C-j> :m .+1<CR>==
        nnoremap <C-k> :m .-2<CR>==
        inoremap <C-j> <Esc>:m .+1<CR>==gi
        inoremap <C-k> <Esc>:m .-2<CR>==gi
        vnoremap <C-j> :m '>+1<CR>gv=gv
        vnoremap <C-k> :m '<-2<CR>gv=gv

    " move vertically by visual line
        nnoremap j gj
        nnoremap k gk

    " Allow backspacing over autoindent, line breaks and start of insert action
        set backspace=indent,eol,start

    " keep off the upper/lower edges
        set scrolloff=5

    " change stuff
        nnoremap <leader>{ ci{
        nnoremap <leader>} ca{
        nnoremap <leader>( ci(
        nnoremap <leader>) ca(
        nnoremap <leader>[ ci[
        nnoremap <leader>] ca[

" DISPLAY
    " alternate folding
        " set foldmethod=indent
        nnoremap <space> za
        " nnoremap <leader>f zR

    " display numbers
        set number
        set relativenumber

    " toggles between hybrid and normal numbers on focus loss or mode
    " https://jeffkreeftmeijer.com/vim-number/
        augroup numbertoggle
          autocmd!
          autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
          autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
        augroup END

    " indentation
        set autoindent

    " eg for latex
        set conceallevel=2
        nnoremap <leader>gl guiwi\gls{<esc>ea}<esc>

    "number of visual spaces per tab
        set tabstop=2
        set smarttab
        set expandtab
        set shiftwidth=2
        set softtabstop=2
        autocmd FileType make setlocal noexpandtab softtabstop=0

        set lcs+=space:·
        " set list

    "highlight the line we are on
        set cursorline
        set cursorcolumn

    "Add a colored line at certain intervals
        set colorcolumn=80,160

    " dark bg
        set background="dark"

    " full color support, disabled for urxvt
        if $TERM =~ '^\(rxvt\)\(-.*\)\?$'
            set notermguicolors
        else
            set termguicolors
        endif

    " Set the command window height to 2 lines, to avoid many cases of having to press <Enter> to continue"
        " set cmdheight=2 "generally wastes window height
        set synmaxcol=2048

    colorscheme koehler 

    " figuring out what the color group is [9]
    " function! g:SyntaxGroup() abort
    "     let l:s = synID(line('.'), col('.'), 1) 
    "     echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
    " endfunction        
    " nnoremap <Leader>sg :call SyntaxGroup()<CR> 

" SEARCHING
    "immediately start searching
        set incsearch
        set hlsearch
    " toggle search highlight
    "    nnoremap <leader>h :set hlsearch!<CR>
    "wtf smartcase is not set without ignorecase
        set ignorecase
        set smartcase 
    "toggles smartcase and shows what is set
    "    :map \s :set smartcase!<CR>:set smartcase?<CR>
    "replacing [16]
    if has('nvim')
        set inccommand=nosplit
    endif

        nnoremap S :%s//g<Left><Left>
    "search for visual selection
        vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" NAV
    " search subfolders for tabcomplete, use e.g. with find [1]
        " allows * for fuzzysearch
        set path+=**

    " file browser [1]
        " better cmdline completion
        set wildmenu

        filetype plugin on

        let g:netrw_banner=0        " disable annoying banner
        " let g:netrw_browse_split=4  " open in prior window
        let g:netrw_altv=1          " open splits to the right
        let g:netrw_liststyle=3     " tree view
        let g:netrw_list_hide=netrw_gitignore#Hide()
        let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

    " cleaner file suggestions
        " list the following files last
          set suffixes+=.pdf,.stl,.svg,.log,.out
        " never show the following
          set wildignore+=*.aux,*.acn,*.acr,*.alg,*.ist,*.toc,*.o

" TAG JUMPING [1]
    " Create the `tags` file (may need to install ctags first)
    command! MakeTags !ctags -R .

" some security fix [3]
    set modelines=0
    set nomodeline

" UTILITY [17]
    nnoremap <Leader>us :setlocal spell! spelllang=en_us<CR>
    nnoremap <Leader>de :setlocal spell! spelllang=de_de<CR>
    "show file (not rifle as that would open vi)
    nnoremap <Leader>s :!$PDFVIEWER % &<CR>
    "toggle line numbers
    nnoremap <Leader>n :set rnu!<CR> 
    nnoremap <Leader>nn :set nu!<CR> 
    "make
    nnoremap <Leader>m :make >/dev/null 2>&1<CR>
    nnoremap <Leader>mm :make
    "buffer nav
    nnoremap <leader>j :ls<CR>:b<space>
    nnoremap <leader>jj :b#<CR>
    "open new files in new buffer
    nnoremap gn :tabedit <cfile><CR>
    nnoremap <leader>rr :source $MYVIMRC<CR>

    nnoremap <Leader>v :vsplit<CR> 
    nnoremap <leader><space> :Files<CR>

    " quicker window resizing
    nnoremap <leader>h :vertical resize -10<CR>
    nnoremap <leader>l :vertical resize +10<CR>

    nnoremap <Leader>tts :%s/\t/    /g

  " set settings for filetypes
    autocmd FileType c set tabstop=4 shiftwidth=4 cinoptions=l1
    autocmd FileType cpp set tabstop=4 shiftwidth=4 cinoptions=l1
    autocmd FileType h set tabstop=2 shiftwidth=2
    autocmd FileType html set tabstop=2 shiftwidth=2
    autocmd FileType lua set tabstop=8 shiftwidth=8
    autocmd FileType md set tabstop=2 shiftwidth=2 spelllang=en_us spell
    autocmd FileType py set tabstop=4 shiftwidth=4
    autocmd FileType tex set spell! spelllang=en_us spell
    autocmd FileType ts set tabstop=2 shiftwidth=2
    autocmd FileType xml set tabstop=2 shiftwidth=2
    autocmd FileType yaml set tabstop=2 shiftwidth=2
    autocmd FileType make setlocal noexpandtab softtabstop=0
