vim.cmd [[
  silent! autocmd! filetypedetect BufRead,BufNewFile *.tf
  autocmd BufRead,BufNewFile *.hcl set filetype=hcl
  autocmd BufRead,BufNewFile .terraform,terraform.rc set filetype=hcl
  autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform
  autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json
]]

-- TODO: investigate this
-- autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()
