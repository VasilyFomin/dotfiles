set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source $HOME/.vimrc
source $HOME/.config/nvim/plug-config/coc.vim
