" mappings to ressemble an IDE
" opens gdb inside nvim and hopefully javac aswell
nnoremap <F5> :Termdebug<CR> 
" compiling and navigating threw errors
map <F9> :make<Return>:copen<Return>
map <F10> :cprevious<Return>
map <F11> :cnext<Return>

packadd termdebug 
let g:termdebug_wide=1 "debugger window on the left

autocmd Filetype c set makeprg=gcc\ -g\ -o\ %<\ %
autocmd Filetype c set errorformat=%+A\ %#%f\ %#(%l\\\,%c):\ %m,%C%mq " format of compilation errors for C
autocmd Filetype java set makeprg=javac\ %
autocmd Filetype java set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#  " format of compilation errors for java

"---ALE show errors in files
	"Mappings in the style of unimpaired-next
	nmap <silent> [W <Plug>(ale_first)
	nmap <silent> [w <Plug>(ale_previous)
	nmap <silent> ]w <Plug>(ale_next)
	nmap <silent> ]W <Plug>(ale_last)
