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
    

"    autocmd BufWritePost *.tex silent! execute "![ -z $(ps h -C $PDFVIEWER) ] || make >/dev/null 2>&1 &" | redraw! 
