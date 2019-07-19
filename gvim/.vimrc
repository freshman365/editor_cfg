"winpos 5 5                   " 设定窗口位置  
""set lines=40 columns=155    " 设定窗口大小  
""set lines=35 columns=140

" dispaly line number
set number
" ignore case when search
set ignorecase
set smartcase

" change TAB to 4 space
set expandtab
set tabstop=4

"indent
set autoindent smartindent shiftround
set shiftwidth=4

"theme
set background=dark
colorscheme desert

"set font size
set guifont=Monospace\ 12

"statusline                                                                                                                                  
" set statusline=  
"set statusline+=%7*\[%n]                                  "buffernr  
"set statusline+=%1*\ %<%F\                                "文件路径  
"set statusline+=%2*\ %y\                                  "文件类型  
"set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "编码1  
"set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "编码2  
"set statusline+=%4*\ %{&ff}\
"文件系统(dos/unix..)   
"set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "语言 & 是否高亮，H表示高亮?  
"set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "光标所在行号/总行数 (百分比)  
"set statusline+=%9*\ col:%03c\                            "光标所在列  
"set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Read only? Top/bottom

" highlight line and column
set cursorcolumn
set cursorline

"fold method
set foldmethod=indent
"set foldlevel=99
"set foldenable      " 允许折叠  

" custom maps
nmap qq :q<cr>
nmap <c-d> yyp
nmap <c-s> :w<cr>
imap <c-s> <esc>:w<cr>
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
imap <c-up> <esc>ddkkpi
imap <c-down> <esc>ddpi

"nmap wm :WMToggle<cr>
map <f2> :NERDTree<cr>
" syntax highlight 
au BufRead,BufNewFile *.v,*.sv set filetype=systemverilog



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: ma6174") 
        call append(line(".")+2, "\# mail: ma6174@163.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: ma6174") 
        call append(line(".")+2, "    > Mail: ma6174@163.com ") 
        call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 
