set encoding=utf-8

let g:mapleader = "\<Space>"
let g:maplocalleader="\\"

" plugins
source $XDG_CONFIG_HOME/nvim/plugins.vim

" base-16 theme
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" local overrides
let s:vimrc_local = "$XDG_CONFIG_HOME/nvim/local.vim"
if filereadable(s:vimrc_local)
  execute "source " . s:vimrc_local
endif