"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
"分割线
autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>
"斜体文本
autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
"加粗文本
autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
"粗斜体文本
autocmd Filetype markdown inoremap <buffer> ,bi ****** <++><Esc>F*hhi
"删除线文本
autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
"下划线文本
autocmd Filetype markdown inoremap <buffer> ,u <u><++></u> <++><Esc>0
"单行代码
autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
"多行代码
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
"标题
autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,5 #####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,6 ######<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>
"复选框勾选mark
autocmd Filetype markdown inoremap <buffer> ,m - [ ] 
"图片
autocmd Filetype markdown inoremap <buffer> ,p2 ![](<++>) <++><Esc>F[a
"autocmd Filetype markdown inoremap <buffer> ,p1 ![](<++> "<++>") <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,p1 <div class="pic" align=center><Enter><img src="./<++>" width="60%" height="40%"></div><Space><Enter><++><Esc>kf"a
"超链接 链接名-链接url
autocmd Filetype markdown inoremap <buffer> ,a [<++>](<++>) <++><Esc>0
"脚注
autocmd Filetype markdown inoremap <buffer> ,j [^<++>]<Enter>[^<++>]:<Esc>k0
"
