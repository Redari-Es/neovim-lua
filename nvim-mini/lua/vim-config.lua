--
-- old vim config
--
--
-- 暂时用vimscript
vim.cmd [[
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set formatoptions-=tc
]]
vim.cmd [[
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
"silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
  set undofile
  set undodir=$HOME/.config/nvim/tmp/undo,.
  endif

  ]]

  -- sources
  -- markdown
  vim.cmd [[
  " Snippets
  source $HOME/.config/nvim/md-snippets.vim
  "source $XDG_CONFIG_HOME/nvim/md-snippets.vim
  " auto spell
  autocmd BufRead,BufNewFile *.md setlocal spell
  "autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()
  " ===
  " === markdown pic
  " ===

  "设置默认储存文件夹。这里表示储存在当前文档所在文件夹下的'pic'文件夹下，相当于 ./pic/
  let g:mdip_imgdir = 'pic'
  "设置默认图片名称。当图片名称没有给出时，使用默认图片名称
  let g:mdip_imgname = 'image'
  "设置快捷键，个人喜欢 Ctrl+p 的方式，比较直观
  autocmd FileType markdown nnoremap <silent> <C-p> :call mdip#MarkdownClipboardImage()<CR>F%i

  ]]

  -- web
  vim.cmd [[
  " ===
  " === web
  " ===
  autocmd FileType vue syntax sync fromstart
  autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

  ]]

  vim.cmd [[
  " Auto change directory to current dir
  autocmd BufEnter * silent! lcd %:p:h

  ]]



  -- coc
  vim.cmd [[
  " press f10 to show hlgroup
  "map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
  "\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  "\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

  function! SynGroup()
  let l:s = synID(line('.'), col('.'), 1)
  echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
  endfun
  map <F10> :call SynGroup()<CR>


  " Compile function
  noremap r :call CompileRunGcc()<CR>
  func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    set splitbelow
    :sp
    :res -5
    exec "!gcc % -o %<"
    :term ./%< && time
  elseif &filetype == 'cpp'
    set splitbelow
    exec "!g++ -std=c++11 % -Wall -o %<"
    :sp
    :res -5
    :term ./%< && time
  elseif &filetype == 'go'
    set splitbelow
    :sp
    :term go run % && time
  elseif &filetype == "swift"
    set splitbelow
    :sp
    :res -5
    term swift % && time
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    set splitbelow
    :sp
    :term python3 % && time
  elseif &filetype == 'php'
    :sp
    :term web "127.0.0.1:8080/PHP/%<.php"&
  elseif &filetype == 'html'
    silent! exec "!".g:mkdp_browser." % &"
  elseif &filetype == 'markdown'
    exec "InstantMarkdownPreview"
  elseif &filetype == 'tex'
    silent! exec "VimtexStop"
    silent! exec "VimtexCompile"
  elseif &filetype == 'dart'
    exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
    silent! exec "CocCommand flutter.dev.openDevLog"
  elseif &filetype == 'javascript'
    set splitbelow
    :sp
    :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
  elseif &filetype == 'java'
    set splitbelow
    :sp
    :res -5
    term javac % && time java %<
    endif
    endfunc

    ]]
    vim.cmd 'source ~/.config/nvim/lua/plugins/plug-config.vim'
    -- require'./plugins/plug-config.vim'
    -- vim.cmd 'source ./plugins/plug.config.vim'
