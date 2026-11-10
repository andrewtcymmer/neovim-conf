return {
	name = "gopls",
	cmd = { "gopls" },
	root_dir = vim.fs.root(0, { "go.mod", ".git" }),
	settings = {},
}
