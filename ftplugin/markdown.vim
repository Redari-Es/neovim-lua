setlocal shiftwidth=2 softtabstop=2 expandtab smarttab
"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)

inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
"分割线
inoremap <buffer> ,n ---<Enter><Enter>
"斜体文本
inoremap <buffer> ,i ** <++><Esc>F*i
"加粗文本
inoremap <buffer> ,b **** <++><Esc>F*hi
"粗斜体文本
inoremap <buffer> ,bi ****** <++><Esc>F*hhi
"删除线文本
inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
"下划线文本
inoremap <buffer> ,u <u><++></u> <++><Esc>0
"单行代码
inoremap <buffer> ,d `` <++><Esc>F`i
"多行代码
inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
"标题
inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
inoremap <buffer> ,5 #####<Space><Enter><++><Esc>kA
inoremap <buffer> ,6 ######<Space><Enter><++><Esc>kA
inoremap <buffer> ,l --------<Enter>
"复选框勾选mark
inoremap <buffer> ,m - [ ] 
inoremap <buffer> ,p2 ![](<++>) <++><Esc>F[a
"autocmd Filetype markdown inoremap <buffer> ,p1 ![](<++> "<++>") <++><Esc>F[a
inoremap <buffer> ,p1 <div class="pic" align=center><Enter><img src="./<++>" width="60%" height="40%"></div><Space><Enter><++><Esc>kf"a
"超链接 链接名-链接url
inoremap <buffer> ,a [<++>](<++>) <++><Esc>0
"脚注
inoremap <buffer> ,j [^<++>]<Enter>[^<++>]:<Esc>k0
"

