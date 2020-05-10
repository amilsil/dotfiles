Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'buoto/gotests-vim'
    "let g:gotests_bin = '/Users/amil/go/bin/gotests'

augroup golang
    let g:deoplete#enable_at_startup = 1
    let g:go_auto_type_info = 1
    let g:go_auto_sameids = 1
    let g:go_fmt_command = "goimports"

    " run :GoBuild or :GoTestCompile based on the go file
    function! s:build_go_files()
        let l:file = expand('%')
        if l:file =~# '^\f\+_test\.go$'
            call go#test#Test(0, 1)
        elseif l:file =~# '^\f\+\.go$' call go#cmd#Build(0)
        endif
    endfunction

    autocmd FileType go nmap <leader>gb :<C-u>call <SID>build_go_files()<CR>
    autocmd FileType go nmap <Leader>gc <Plug>(go-coverage-toggle)
    autocmd FileType go nmap <Leader>gr <Plug>(go-run)
    autocmd FileType go nmap <Leader>gt <Plug>(go-test)
    " switch between impls and test
    autocmd Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
    autocmd Filetype go nmap <leader>gah <Plug>(go-alternate-split)
    autocmd Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
augroup END

