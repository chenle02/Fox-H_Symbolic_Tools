set tw=300
autocmd FileType wl setlocal commentstring=(\*%s\*)
autocmd FileType wl noremap <leader><leader> :w<cr> :!./Build.sh %<cr>
autocmd FileType wl noremap <leader><enter> :!zathura %:r_output.pdf&<cr>

autocmd BufEnter *_additional.tex noremap <leader><leader> :w<cr> :!./check_additional.sh %:r<cr>
autocmd BufEnter *_additional.tex noremap <leader><enter> :!zathura %:r_additional.pdf&<cr>
