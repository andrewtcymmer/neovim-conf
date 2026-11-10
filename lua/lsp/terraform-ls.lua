return {
	name = "terraform_ls",
	cmd = { "terraform-ls", "serve" },
	root_dir = vim.fs.root(0, { ".terraform", ".git" }),
	settings = {},
}
