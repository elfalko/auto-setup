" PLUGINS
"
" Install Vim Plug if not installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
" execute '!echo '.glob(data_dir . '/autoload/plug.vim')
if empty(glob(data_dir . '/autoload/plug.vim'))
  if !has('curl')
    execute '!echo "install curl first for plug download"'
  endif
  execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  " execute '!wget -P '.data_dir.'/autoload/plug.vim --no-clobber https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \| PlugInstall --sync | source $MYVIMRC
      \| endif

if !  empty(glob(data_dir . '/autoload/plug.vim'))
  call plug#begin()
  source ~/.config/nvim/colorschemes.vim

  "Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }

  source ~/.config/nvim/tmux.vim

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

  source ~/.config/nvim/coc.vim

  Plug 'norcalli/nvim-colorizer.lua'

  call plug#end()
endif
" Initialize plugin system
" :PlugInstall

