
" ale specific settings
let g:ale_sign_error = '>>'   " default
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0   " less distracting when opening a new file
let g:ale_linters = {
      \'ruby': ['standardrb'],
      \}
let g:ale_fixers = {
      \'javascript': ['eslint'],
      \}


