require'texmagic'.setup {
  engines = {
    pdflatex = {
      executable = 'latexmk',
      args = {
        "-pdflatex",
        "-interaction=nonstopmode",
        "-synctex=1",
        "-outdir=.build",
        "-pv",
        "%f"
      },
      isContinuous = false
    },
    lualatex = {
      executable = 'latexmk',
      args = {
        "-pdflua",
        "-interaction=nonstopmode",
        "-synctex=1",
        "-pv",
        "%f"
      },
      isContinuous = false
    }
  }
}
