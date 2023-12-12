set tw=300
autocmd FileType wl setlocal commentstring=(\*%s\*)
autocmd FileType wl noremap <leader><leader> :w<cr> :!./Build.sh %<cr>
autocmd FileType wl noremap <leader><enter> :!zathura %:r_output.pdf&<cr>
