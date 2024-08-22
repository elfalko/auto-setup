" LATEX
nnoremap <leader>gl guiwi\gls{<esc>ea}<esc>
nnoremap <Leader>tli :-1read ${HOME}/auto-setup/templates/latex/itemize<CR>jA
nnoremap <Leader>tlt :-1read ${HOME}/auto-setup/templates/latex/tabular<CR>2jA
nnoremap <Leader>tl[ :-1read ${HOME}/auto-setup/templates/latex/bracket<CR>2ei
nnoremap <Leader>tl{ :-1read ${HOME}/auto-setup/templates/latex/brace<CR>2ei
nnoremap <Leader>tl( :-1read ${HOME}/auto-setup/templates/latex/parenthesis<CR>2ei
nnoremap <Leader>gl guiwi\gls{<esc>ea}<esc>
nnoremap <Leader>sn I\section{<esc>A}\label{}<esc>i
nnoremap <Leader>ssn I\subsection{<esc>A}\label{}<esc>i
nnoremap <Leader>sssn I\subsubsection{<esc>A}\label{}<esc>i
nnoremap <Leader>p I\paragraph{<esc>A}\label{}<esc>i
nnoremap <Leader>tf i\fig{}{}{}{}{}<esc>3F}i
nnoremap <Leader>ra i$\rightarrow$<esc>
nnoremap <Leader>pl <esc>0df yypgu$k0<esc>I\paragraph{<esc>A}\label{<esc>JxA}
