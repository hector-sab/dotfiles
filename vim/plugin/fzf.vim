"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://www.youtube.com/watch?v=on1AzaZzQ7k
" https://www.chrisatmachine.com/Neovim/08-fzf/
nnoremap <c-p> :Files<CR>

nnoremap <leader>ps :Rg<SPACE><CR>

nnoremap <leader>pf :RgFiles<SPACE><CR>

" Window Location
let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 0.6, 'yoffset': 1 } }

"Get Files
command! -bang -nargs=? -complete=dir GFiles
    \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" For searching filenames and content
command! -bang -nargs=* RgFiles
    \ call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '
    \ . (len(<q-args>) > 0 ? <q-args> : '""'), 0,
    \ fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" To only show files with match in the content
command! -bang -nargs=* Rg
    \ call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '
    \ . (len(<q-args>) > 0 ? <q-args> : '""'), 0,
    \ fzf#vim#with_preview({'options': ['--delimiter=:', '--nth=2..', '--layout=reverse', '--info=inline']}), <bang>0)

" For trying to het more flexibility look at this issue
" https://github.com/junegunn/fzf.vim/issues/419

"command! -bang -nargs=* Rg
"  \ call fzf#vim#grep(
"  \   'rg --column --line-number --no-heading --color=always '
"  \ . <q-args>, 1,
"  \   <bang>0 ? fzf#vim#with_preview('up:60%')
"  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"  \   <bang>0)

"command! -bang -nargs=* Rg
"  \ call fzf#vim#grep(
"  \   'rg --column --line-number --no-heading --color=always ' 
"  \  . (len(<q-args>) > 0 ? <q-args> : '""'), 1,
"  \   <bang>0 ? fzf#vim#with_preview('up:60%')
"  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"  \   <bang>0)
