set tw=300
autocmd FileType wl setlocal commentstring=(\*%s\*)
autocmd FileType wl noremap <leader><leader> :w<cr> :!./Build.sh %<cr>
autocmd FileType wl noremap <leader><enter> :!zathura %:r_output.pdf&<cr>

autocmd BufEnter *_additional.tex noremap <leader><leader> :w<cr> :!./check_additional.sh %:r<cr>
autocmd BufEnter *_additional.tex noremap <leader><enter> :!zathura %:r_additional.pdf&<cr>


function! GotoAdditionalFile()
    " Check if '_output' is in the filename
    if match(expand('%'), '_output') != -1
        " Get the current file name and replace _output with _additional
        let l:addfile = substitute(expand('%'), '_output', '_additional', '')

        " Create and open the new file
        execute 'e ' . l:addfile

    else
        " Display a message if '_output' is not in the filename
        echom "This operation is only valid for files with '_output' in their name."
    endif
endfunction
nnoremap <leader>a :call GotoAdditionalFile()<cr>
