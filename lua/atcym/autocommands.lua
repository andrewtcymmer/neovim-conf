vim.cmd [[
  silent! autocmd! filetypedetect BufRead,BufNewFile *.tf
  autocmd BufRead,BufNewFile *.hcl set filetype=hcl
  autocmd BufRead,BufNewFile .terraform,terraform.rc set filetype=hcl
  autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform
  autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json
]]

-- TODO: investigate this
-- autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()

-- TODO: factor this into a rust-only config file?
vim.cmd [[
  augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd          <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs          <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx          <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> gt          <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> <leader> gd <Plug>(rust-doc)
    autocmd FileType rust nmap <buffer> <leader> gD <Plug>(rust-doc-tab)
  augroup END

  " Function keys
  nmap <F9> :RustFmt<CR>
]]
