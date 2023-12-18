
function! s:bibtex_cite_sink(lines)
    let r = system("bibtex-cite", a:lines)
    let modified_r = substitute(r, '^@', 'select { key "', '') . '" }'
    execute ':normal! a' . modified_r
endfunction

nnoremap <silent> <space>c :call fzf#run({
                        \ 'source': 'bibtex-ls',
                        \ 'sink*': function('<sid>bibtex_cite_sink'),
                        \ 'up': '40%',
                        \ 'options': '--ansi --layout=reverse-list --multi --prompt "Cite> "'})<CR>

