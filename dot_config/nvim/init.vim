set encoding=utf-8

let g:mapleader = "\<Space>"
let g:maplocalleader="\\"

" plugins
source $XDG_CONFIG_HOME/nvim/plugins.vim

" local overrides
let s:vimrc_local = "$XDG_CONFIG_HOME/nvim/local.vim"
if filereadable(s:vimrc_local)
  execute "source " . s:vimrc_local
endif