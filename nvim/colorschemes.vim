" color scheme
Plug 'whatyouhide/vim-gotham'
Plug 'cocopon/iceberg.vim' "[12]
Plug 'fenetikm/falcon' " [13]
Plug 'arcticicestudio/nord-vim' " [14]
Plug 'relastle/bluewery.vim' " [15]

nnoremap <Leader>c1 :colorscheme gotham<CR>:hi! Comment guifg=#0b6e8a<CR>:hi! CursorLine guibg=#103040<CR>
nnoremap <Leader>c2 :colorscheme iceberg<CR>
nnoremap <Leader>c3 :colorscheme falcon<CR>
nnoremap <Leader>c4 :colorscheme nord<CR>
nnoremap <Leader>c5 :colorscheme bluewery<CR>

try
  silent! colorscheme gotham
  hi! Comment guifg=#0b6e8a
  hi! CursorLine guibg=#404040
  hi! CursorColumn guibg=#404040
catch
  !echo "Gotham not found"
endtry

