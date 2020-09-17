" Linting
let g:ale_linters = {
      \  'java': ['javac']
      \ }

" Fixing
nmap <F8> <Plug>(ale_fix)

let g:ale_fix_on_save=1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'java': ['google_java_format']
\}

" Completion
