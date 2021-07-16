" GENERAL
    " set leader key
        let mapleader=","
    " no annoying sound
        set visualbell

    " enable syntax processing
        syntax enable

    " no legacy stuff
        set nocompatible
        syntax enable

    " Show partial commands in the last line of the screen
        set showcmd

    " ask for confirmation instead of failing command
        set confirm

    " persistent undos [4]
        set undodir=~/.config/nvim/undodir
        set undofile

    " fix: vim gtk [4]
        set clipboard=unnamedplus

        set formatoptions+=j " Delete comment character when joining commented lines [4]

    " files
        set fileformat=unix

    " open my vimnotes
        nnoremap <Leader>hhh :tabedit /home/f/.falk/nvim/notes<CR>
        nnoremap <Leader>init :tabedit /home/f/.falk/nvim/init.vim<CR>
        
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

" DISPLAY
    " alternate folding
        set foldmethod=indent
        nnoremap <space> za
        nnoremap <leader>f zR

    " display numbers
        set number

    " indentation
        set autoindent

    " eg for latex
        set conceallevel=2

    "number of visual spaces per tab
        set tabstop=4 

    "tabs are spaces
        set expandtab
        set shiftwidth=4

    "number of spaces in tab when editing
        set softtabstop=4

    "highlight the line we are on
        set cursorline

    "Add a colored line after at 80 characters
        set colorcolumn=80

    " dark bg
        set background="dark"

    " full color support, disabled for urxvt
        if $TERM =~ '^\(rxvt\)\(-.*\)\?$'
            set notermguicolors
        else
            set termguicolors
        endif

    " Set the command window height to 2 lines, to avoid many cases of having to "press <Enter> to continue"
        " set cmdheight=2 "generally wastes window height
        
    colorscheme evening 

    " figuring out what the color group is [9]
    function! g:SyntaxGroup() abort
        let l:s = synID(line('.'), col('.'), 1) 
        echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
    endfunction        

    nnoremap <Leader>sg :call SyntaxGroup()<CR> 

" SEARCHING
    "immediately start searching
        set incsearch
    "highlight search results
        set hlsearch
    " toggle search highlight
        nnoremap <leader>h :set hlsearch!<CR>
    "wtf smartcase is not set without ignorecase
        set ignorecase
        set smartcase 
    "toggles smartcase and shows what is set
        :map \s :set smartcase!<CR>:set smartcase?<CR>
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
          set suffixes+=.pdf,.stl
        " never show the following
          set wildignore+=*.aux

" TAG JUMPING [1]

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

    "mutt
    map <leader>kq G?><CR>d?>--<CR>

" SNIPPETS
    nnoremap <Leader>bash :-1read ${HOME}/.falk/templates/bashscriptheader<CR>

    " LATEX
        nnoremap <Leader>li :-1read ${HOME}/.falk/templates/latex/itemize<CR>jA
        nnoremap <Leader>lt :-1read ${HOME}/.falk/templates/latex/tabular<CR>2jA
        nnoremap <Leader>l[ :-1read ${HOME}/.falk/templates/latex/bracket<CR>2ei
        nnoremap <Leader>l{ :-1read ${HOME}/.falk/templates/latex/brace<CR>2ei
        nnoremap <Leader>l( :-1read ${HOME}/.falk/templates/latex/parenthesis<CR>2ei
    "MA
        nnoremap <Leader>lid \gls{lidar} 

" PLUGINS
    " Install Vim Plug if not installed

    let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
    if empty(glob(data_dir . '/autoload/plug.vim'))
      execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif


    " Run PlugInstall if there are missing plugins
    autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \| PlugInstall --sync | source $MYVIMRC
    \| endif
    
    call plug#begin()
        " color scheme
        Plug 'whatyouhide/vim-gotham'

        "Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }

        Plug 'christoomey/vim-tmux-navigator'
        let g:tmux_navigator_no_mappings = 1

        nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
        nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
        nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
        nnoremap <silent> <A-l> :TmuxNavigateRight<cr>
        nnoremap <silent> <A-;> :TmuxNavigatePrevious<cr>

        Plug 'lervag/vimtex'

        Plug 'tpope/vim-commentary' "[5]

        Plug 'tpope/vim-surround' "[6]

        Plug 'slim-template/vim-slim' "[10]

        Plug 'sirtaj/vim-openscad' "[11]

        Plug 'cocopon/iceberg.vim' "[12]

        Plug 'fenetikm/falcon' " [13]

        Plug 'arcticicestudio/nord-vim' " [14]

        Plug 'relastle/bluewery.vim' " [15]

        Plug 'unblevable/quick-scope' " [21]

        "Plug 'jiangmiao/auto-pairs' " [22]

        " color hex codes
        " Plug 'norcalli/nvim-colorizer.lua'

        Plug 'Vimjas/vim-python-pep8-indent'

        Plug 'mg979/vim-visual-multi', {'branch': 'master'} " [23]
        " Initialize plugin system
        " :PlugInstall
        
    call plug#end()

    nnoremap <Leader>c1 :colorscheme gotham<CR>:hi! Comment guifg=#0b6e8a<CR>:hi! CursorLine guibg=#103040<CR>
    nnoremap <Leader>c2 :colorscheme iceberg<CR>
    nnoremap <Leader>c3 :colorscheme falcon<CR>
    nnoremap <Leader>c4 :colorscheme nord<CR>
    
    "for qmk keymap editing
    nnoremap <Leader><Leader> cf,_______, <Esc>l

    colorscheme falcon 

" TWEAKS [4]
    autocmd FileType yaml set tabstop=2 shiftwidth=2
    autocmd FileType h set tabstop=2 shiftwidth=2
    autocmd FileType cpp set tabstop=2 shiftwidth=2
    autocmd FileType c set tabstop=2 shiftwidth=2
    autocmd FileType py set tabstop=4 shiftwidth=4
    autocmd FileType tex set spell! spelllang=en_us

"    autocmd BufWritePost *.tex silent! execute "![ -z $(ps h -C $PDFVIEWER) ] || make >/dev/null 2>&1 &" | redraw! 
"    autocmd BufWritePost *.ms silent! execute "![ -z $(ps h -C $PDFVIEWER) ] || make -B @% >/dev/null 2>&1" | redraw!
"    autocmd BufWritePost *.md execute "![ -z $(ps h -C $PDFVIEWER) ] || lowdown -sTms % | pdfroff -tik -Kutf8 -mspdf > %.pdf" | redraw!

" TODO
    " Stop movements from always going to the first character of a line.
        " set nostartofline
    " TODO [4]
    " QuickfixFormatter [7]
    " fix line number color
    " fix current line highligh color
    " paste mode stuff [18]
    " [20] quickfix error format, include/define, tags
    " majutsushi/tagbar
    

" SOURCES
    " [1] https://www.youtube.com/watch?v=XA2WjJbmmoM&vl=en
    " [2] https://vim.fandom.com/wiki/Moving_lines_up_or_down
    " [3] https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
    " [4] https://alex.dzyoba.com/blog/vim-revamp/
    " [5] https://github.com/tpope/vim-commentary
    " [6] https://github.com/tpope/vim-surround
    " [7] https://github.com/changemewtf/no_plugins
    " [8] https://speakerdeck.com/cocopon/creating-your-lovely-color-scheme?slide=30
    " [9] https://www.reddit.com/r/neovim/comments/fm2tnz/how_to_make_a_colorscheme_for_nvim_and_other/
    " [10] https://github.com/slim-template/vim-slim
    " [11] https://github.com/sirtaj/vim-openscad
    " [12] https://github.com/cocopon/iceberg.vim/
    " [13] https://github.com/fenetikm/falcon
    " [14] https://github.com/arcticicestudio/nord-vim
    " [15] https://github.com/relastle/bluewery.vim
    " [16] https://blog.kdheepak.com/three-built-in-neovim-features.html
    " [17] https://www.youtube.com/watch?v=d8XtNXutVto&feature=youtu.be
    " [18] https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
    " [19] https://www.freecodecamp.org/news/learn-linux-vim-basic-features-19134461ab85/
    " [20] https://www.youtube.com/watch?v=Gs1VDYnS-Ac
    " [21] https://github.com/unblevable/quick-scope
    " [22] https://github.com/jiangmiao/auto-pairs
    " [22] https://github.com/mg979/vim-visual-multi


