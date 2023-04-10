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

    "number of visual spaces per tab
        set tabstop=4 
        set smarttab
        set expandtab
        set shiftwidth=4
        set softtabstop=4
        autocmd FileType make setlocal noexpandtab softtabstop=0

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

    
        
    colorscheme evening 

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
          set suffixes+=.pdf,.stl,.svg,.o
        " never show the following
          set wildignore+=*.aux

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

" mutt
    map <leader>kq G?><CR>d?>--<CR>

" SNIPPETS
    nnoremap <Leader>ba :-1read ${HOME}/auto-setup/templates/bash/header<CR>
    nnoremap <Leader>bh :-1read ${HOME}/auto-setup/templates/bash/help<CR>
    nnoremap <Leader>bp :-1read ${HOME}/auto-setup/templates/bash/params<CR>
    nnoremap <Leader>ff o//TODO FSC 
    nnoremap <Leader>## 80i#<Esc>

" LATEX
    nnoremap <Leader>tli :-1read ${HOME}/auto-setup/templates/latex/itemize<CR>jA
    nnoremap <Leader>tlt :-1read ${HOME}/auto-setup/templates/latex/tabular<CR>2jA
    nnoremap <Leader>tl[ :-1read ${HOME}/auto-setup/templates/latex/bracket<CR>2ei
    nnoremap <Leader>tl{ :-1read ${HOME}/auto-setup/templates/latex/brace<CR>2ei
    nnoremap <Leader>tl( :-1read ${HOME}/auto-setup/templates/latex/parenthesis<CR>2ei
    nnoremap <Leader>gl guiwi\gls{<esc>ea}<esc>
    nnoremap <Leader>sn I\section{<esc>A}\label{}<esc>i
    nnoremap <Leader>ssn I\subsection{<esc>A}\label{}<esc>i
    nnoremap <Leader>sssn I\subsubsection{<esc>A}\label{}<esc>i
    nnoremap <Leader>p I\paragrap{<esc>A}\label{}<esc>i
    nnoremap <Leader>tf i\fig{}{}{}{}{}<esc>3F}i
    nnoremap <Leader>ra i$\rightarrow$<esc>
    nnoremap <Leader>aw c2j\axweb{<esc>JA}{<esc>JA}<CR><esc>
    nnoremap <Leader>af c2j\axfp{<esc>JA}{<esc>JA}<CR><esc>
    nnoremap <Leader>as c/‘<CR>\axsnmp{<esc>JxA}{<esc>JxA}{<esc>JxA}{<esc>JxA}{\axsnmpsixty <esc>d/ax60<CR>d2f <esc>JxA}<esc>
    nnoremap <Leader>pl <esc>0df yypgu$k0<esc>I\paragraph{<esc>A}\label{<esc>JxA}


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

        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'

        Plug 'lervag/vimtex'

        Plug 'tpope/vim-commentary' "[5]
        Plug 'tpope/vim-surround' "[6]
        Plug 'tpope/vim-repeat' "supports vim-surround
        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-abolish'

        Plug 'slim-template/vim-slim' "[10]

        Plug 'sirtaj/vim-openscad' "[11]

        Plug 'cocopon/iceberg.vim' "[12]

        Plug 'fenetikm/falcon' " [13]

        Plug 'arcticicestudio/nord-vim' " [14]

        Plug 'relastle/bluewery.vim' " [15]

        Plug 'unblevable/quick-scope' " [21]

        "Plug 'jiangmiao/auto-pairs' " [22]

        Plug 'Vimjas/vim-python-pep8-indent'

        Plug 'AlphaTechnolog/pywal.nvim', { 'as': 'pywal' }


        Plug 'mg979/vim-visual-multi', {'branch': 'master'} " [23]

        if has('nvim')
            " write in browser [26]
            " Plug 'subnut/nvim-ghost.nvim', {'do': ':call nvim_ghost#installer#install()'}       
            " augroup nvim_ghost_user_autocommands
            "     au User *.reddit.com set filetype=markdown
            "     au User *.stackoverflow.com set filetype=markdown
            "     au User *github.com set filetype=markdown
            "     au User intranet.lan.work-microwave.com set filetype=markdown
            " augroup END

            " let g:nvim_ghost_super_quiet = 1
            
            " [27]
            Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
        endif

        " [25]
        " if has('nvim')
        "   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        " else
        "   Plug 'Shougo/deoplete.nvim'
        "   Plug 'roxma/nvim-yarp'
        "   Plug 'roxma/vim-hug-neovim-rpc'
        " endif

        " let g:deoplete#enable_at_startup = 1

        " Plug 'deoplete-plugins/deoplete-clang'

        " Plug 'dense-analysis/ale'

        " let g:ale_linters = {
        "     \ 'python': ['pylint'],
        "     \ 'vim': ['vint'],
        "     \ 'cpp': ['clang'],
        "     \ 'c': ['clang']
        " \}

        " " custom setting for clangformat
        " let g:neoformat_cpp_clangformat = {
        "     \ 'exe': 'clang-format',
        "     \ 'args': ['--style="{IndentWidth: 4}"']
        " \}
        " let g:neoformat_enabled_cpp = ['clangformat']
        " let g:neoformat_enabled_c = ['clangformat']
        "
        " Conquer of Completion
        " Use release branch (recommend)
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        let g:coc_global_extensions = [ 'coc-json', 'coc-git', 'coc-prettier', 'coc-yaml']

        " Default CoC stuff
        " if hidden is not set, TextEdit might fail.
        set hidden

        " Some servers have issues with backup files, see #649
        set nobackup
        set nowritebackup

        " You will have bad experience for diagnostic messages when it's default 4000.
        set updatetime=300

        " don't give |ins-completion-menu| messages.
        set shortmess+=c

        " always show signcolumns
        set signcolumn=yes

        " Use tab for trigger completion with characters ahead and navigate.
        " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
        inoremap <silent><expr> <TAB>
              \ pumvisible() ? "\<C-n>" :
              \ <SID>check_back_space() ? "\<TAB>" :
              \ coc#refresh()
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

        function! s:check_back_space() abort
          let col = col('.') - 1
          return !col || getline('.')[col - 1]  =~# '\s'
        endfunction

        " Use <c-space> to trigger completion.
        inoremap <silent><expr> <c-space> coc#refresh()

        " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
        " Coc only does snippet and additional edit on confirm.
        inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

        " Use `[c` and `]c` to navigate diagnostics
        nmap <silent> [c <Plug>(coc-diagnostic-prev)
        nmap <silent> ]c <Plug>(coc-diagnostic-next)

        " Remap keys for gotos
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)

        " Use K to show documentation in preview window
        nnoremap <silent> K :call <SID>show_documentation()<CR>

        function! s:show_documentation()
          if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
          else
            call CocAction('doHover')
          endif
        endfunction

        " Highlight symbol under cursor on CursorHold
        autocmd CursorHold * silent call CocActionAsync('highlight')

        " Remap for rename current word
        nmap <leader>rn <Plug>(coc-rename)

        " Remap for format selected region
        xmap <leader>f  <Plug>(coc-format-selected)
        nmap <leader>f  <Plug>(coc-format-selected)

        augroup mygroup
          autocmd!
          " Setup formatexpr specified filetype(s).
          autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
          " Update signature help on jump placeholder
          autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
        augroup end

        " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
        xmap <leader>a  <Plug>(coc-codeaction-selected)
        nmap <leader>a  <Plug>(coc-codeaction-selected)

        " Remap for do codeAction of current line
        nmap <leader>ac  <Plug>(coc-codeaction)
        " Fix autofix problem of current line
        nmap <leader>qf  <Plug>(coc-fix-current)

        " Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
        nmap <silent> <TAB> <Plug>(coc-range-select)
        xmap <silent> <TAB> <Plug>(coc-range-select)
        xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

        " Use `:Format` to format current buffer
        command! -nargs=0 Format :call CocAction('format')

        " Use `:Fold` to fold current buffer
        command! -nargs=? Fold :call     CocAction('fold', <f-args>)

        " use `:OR` for organize import of current buffer
        command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

        " Add status line support, for integration with other plugin, checkout `:h coc-status`
        set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

        " Using CocList
        " Show all diagnostics
        nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
        " Manage extensions
        nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
        " Show commands
        nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
        " Find symbol of current document
        nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
        " Search workspace symbols
        nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
        " Do default action for next item.
        nnoremap <silent> <space>j  :<C-u>CocNext<CR>
        " Do default action for previous item.
        nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
        " Resume latest coc list
        nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

        "COC-GIT
        " set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}
        Plug 'norcalli/nvim-colorizer.lua'
                            
    call plug#end()
    " Initialize plugin system
    " :PlugInstall

    nnoremap <Leader>c1 :colorscheme gotham<CR>:hi! Comment guifg=#0b6e8a<CR>:hi! CursorLine guibg=#103040<CR>
    nnoremap <Leader>c2 :colorscheme iceberg<CR>
    nnoremap <Leader>c3 :colorscheme falcon<CR>
    nnoremap <Leader>c4 :colorscheme nord<CR>

    colorscheme gotham
    hi! Comment guifg=#0b6e8a
    hi! CursorLine guibg=#103040

    "for qmk keymap editing
    " nnoremap <Leader><Leader> cf,_______, <Esc>l

" TWEAKS [4]
    autocmd FileType c set tabstop=4 shiftwidth=4
    autocmd FileType cpp set tabstop=4 shiftwidth=4
    autocmd FileType h set tabstop=2 shiftwidth=2
    autocmd FileType lua set tabstop=8 shiftwidth=8
    autocmd FileType md set tabstop=2 shiftwidth=2
    autocmd FileType py set tabstop=4 shiftwidth=4
    autocmd FileType tex set spell! spelllang=en_us
    autocmd FileType xml set tabstop=8 shiftwidth=8
    autocmd FileType yaml set tabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.log set filetype=wmlog
    autocmd BufNewFile,BufRead *.txt set filetype=wmlog
    autocmd FileType make setlocal noexpandtab softtabstop=0

"    autocmd BufWritePost *.tex silent! execute "![ -z $(ps h -C $PDFVIEWER) ] || make >/dev/null 2>&1 &" | redraw! 
"    autocmd BufWritePost *.ms silent! execute "![ -z $(ps h -C $PDFVIEWER) ] || make -B @% >/dev/null 2>&1" | redraw!
"    autocmd BufWritePost *.md execute "![ -z $(ps h -C $PDFVIEWER) ] || lowdown -sTms % | pdfroff -tik -Kutf8 -mspdf > %.pdf" | redraw!

" TODO
    " Stop movements from always going to the first character of a line.
        " set nostartofline
    " TODO [4]
    " QuickfixFormatter [7]
    " fix line number color
    " fix current line highlight color
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
    " [23] https://github.com/mg979/vim-visual-multi
    " [24] https://github.com/Shougo/ddc.vim  TODO requires nvim 5+
    " [25] https://github.com/Shougo/deoplete.nvim

        " [26] https://github.com/subnut/nvim-ghost.nvim
        " [27] https://github.com/glacambre/firenvim
