" RainbowLoad
nmap <leader><leader> :cexpr! system('./FoxH.wls '. expand("%"))<cr>
set tw=300
autocmd FileType wl setlocal commentstring=(\*%s\*)
