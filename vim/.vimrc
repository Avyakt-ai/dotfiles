set number
set relativenumber
set tabstop=4
set shiftwidth=4
set autoindent
set mouse=a
colorscheme slate
noremap j k
noremap k j
command! -nargs=1 -complete=file New :call NewFileWithMain(<f-args>)
function! NewFileWithMain(filename)
    execute 'edit ' . a:filename
    if a:filename =~ '\.c$'
        call append(0, "#include <stdio.h>")
        call append(1, "")
        call append(2, "int main() {")
        call append(3, "")
        call append(4, "    return 0;")
        call append(5, "}")
        normal! gg
        startinsert!
    endif
endfunction
nnoremap x :w \| :q<CR>
