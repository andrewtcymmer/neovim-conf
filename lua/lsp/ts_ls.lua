return {
	name = "ts_ls",
	cmd = { "typescript-language-server", "--stdio" },
	root_dir = vim.fs.root(0, { "package.json", "tsconfig.json", ".git" }),
	settings = {},
}
