General
    :checkhealth
    :help
    :helpgrep
    ^] and ^T
    :h quickref / windows

+++VIMDIFF+++
]-c [-c     navigate to next/previous diff
dp do       push/pull diff

" AUTOCOMPLETE [1] documented in |ins-completion|
    " - ^n ^p for anything specified by the 'complete' option
    " - ^x^n for JUST this file
    " - ^x^f for filenames (works with our path trick!)
    " - ^x^] for tags only (needs to have tags
    ^x^l - whole lines
    " - Use ^n and ^p to go back and forth in the suggestion list
    <C-x> <C-o> - javascript autocomplete
    byte of vim pg 40

" TAG JUMPING [1]
    Create the `tags` file (may need to install ctags first)
    ^] - jump to tag under cursor
    g^] - for ambiguous tags
    ^t - jump back up the tag stack

File browsing
    " - <CR>/v/t to open in an h-split/v-split/tab
    " - check |netrw-browse-maps| for more mappings

search
    ^f in search opens buffer of last searches

tpope/comments
    gc
    gcc

increment list
    select block of numbers with C-v
    g C-a: increment
    g C-x: decrement

fast movement
    ZZ - :wq
    ZQ - :q!

    C-u moves up 
    C-d down half a page

    zz puts line into middle
    zt puts line at top
    zb puts line at top
    
    {} move to paragraph

    wb
    e

    daw deletes word and whitespace
    diw deletes word without whitespace
    dap delete all paragraph
    dip delete all paragraph
    a around
    i in (word object)
 
    c faster than d

    g; g,   go to prev/next edit 

    from [2]
    <c-w>s 	opens split
    <c-w>v 	opens vsplit

marks [3]
    m[a-z]  local mark [a-z]
    m[A-Z]  global mark [A-Z]
    '<m>    goto line of <m>
    `<m>    goto position of <m>
    [' ]'   next/prev mark line
    [` ]`   next/prev mark
    '' ``   jump back
    '[ ']   beginning/end of previously changed/yanked text
    '< '>   beginning/end of last visual selection

    :marks  show marks

    `.      last change in current buffer
    `"      last exit in current buffer
    `<#n>   jump to last nth file edited

history
    q: command history
    q/ search history

    C-i C-o     go in/out in jump history
    C-]         go to definition

utility
    C-g     show position
    gC-g    show more details (works in visual)
    x%      jumps to percentage
    z=      spelling correction

    oO      line above/below
    %       jumps to matching parenthesis

    <space> opens and closes folds
    zR      opens all folds


vim-surround
    add surrounding chars
        select text
        press v, S, surrounding modifier
    alternately ys<object><surrounding char>

    to change try cs<character to change><new>

    opening brackets leave spaces, closing do not
    (test)
    ( test )

commands
  :sort
  :earlier <x>m    timemachine
  norm <cmd> run in normal mode

examples
    dwwP    swap word forwards
    0d^     delete leading whitespace
    g_lD
  
[1] https://www.youtube.com/watch?v=d8XtNXutVto&feature=youtu.be
[2] http://vimcasts.org/blog/2013/01/oil-and-vinegar-split-windows-and-project-drawer/
[3] https://vim.fandom.com/wiki/Using_marks
[4] https://jdhao.github.io/2020/09/22/nifty_nvim_techniques_s7/
[5] https://countvajhula.com/2021/01/21/vim-tip-of-the-day-a-series/

