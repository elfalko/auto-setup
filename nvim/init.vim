exe 'set rtp+=' . expand('~/auto-setup/nvim')
runtime native.vim

" mutt
map <leader>kq G?><CR>d?>--<CR>

" SNIPPETS
nnoremap <Leader>ba :-1read ${HOME}/auto-setup/templates/bash/header<CR>
nnoremap <Leader>bh :-1read ${HOME}/auto-setup/templates/bash/help<CR>
nnoremap <Leader>bp :-1read ${HOME}/auto-setup/templates/bash/params<CR>
nnoremap <Leader>ff o//TODO FSC
nnoremap <Leader>## 80i#<Esc>

runtime plugins.vim

colorscheme gotham
hi! Comment guifg=#0b6e8a
hi! CursorLine guibg=#404040
hi! CursorColumn guibg=#404040

" TWEAKS [4]
" set unknown file types
" source ~/.config/nvim/workmicrowavelog.vim
autocmd BufNewFile,BufRead *.scad set filetype=scad
autocmd BufNewFile,BufRead *.cfg set filetype=cfg
autocmd BufNewFile,BufRead Dockerfile* set filetype=dockerfile

autocmd FileType scad setlocal commentstring=/*\ %s\ */ tabstop=2 shiftwidth=2
autocmd FileType scad silent! execute "![ -z $(ps h -C openscad) ] && openscad % &"
autocmd BufWipeout *.scad execute "!killall openscad"
autocmd FileType cfg colorscheme elflord
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

if has('nvim-0.11')
    runtime luainit.lua
endif

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
    " [28] https://www.reddit.com/r/vim/comments/cp7n72/organizing_vim_configuration_into_multiple_files/
    " [29] https://vimways.org/2018/from-vimrc-to-vim/
