" mappings to automate stuff and allow debugging
" opens gdb inside nvim
nnoremap <F5> :Termdebug<CR> 
" compiling and navigating threw errors
map <F9> :make<Return>:copen<Return>
map <F10> :cprevious<Return>
map <F11> :cnext<Return>

"packadd termdebug 
let g:termdebug_wide=1 "debugger window on the left

autocmd Filetype c set makeprg=gcc\ -g\ -o\ %<\ %
autocmd Filetype java set makeprg=javac\ %
autocmd Filetype java set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
autocmd Filetype ts set makeprg=tsc\ $*\ --outDir\ build\ %
autocmd Filetype ts set errorformat=%+A\ %#%f\ %#(%l\\\,%c):\ %m,%C%m
