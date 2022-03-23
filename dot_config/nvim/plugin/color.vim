syntax on
set background=dark
let g:base16ColorSpace = 256

if filereadable("${HOME}/.vimrc_background")
  source "${HOME}/.vimrc_background"
endif

hi ColorColumn ctermbg=Grey
