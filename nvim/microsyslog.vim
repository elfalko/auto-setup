if did_filetype()	" filetype already set..
  finish		" ..don't do these checks
endif

if getline(1) =~? '^\[Pre-Run.*'
  setfiletype microsyslog
" elseif getline(1) =~? '\<drawing\>'
"   setfiletype log
endif
