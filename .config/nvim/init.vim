set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source $HOME/.vimrc
" pip install cmake-language-server
" sudo npm i -g bash-language-server\n
" sudo npm i -g bash-language-server\n
" sudo npm install -g yaml-language-server\n\n
" sudo npm install -g dockerfile-language-server-nodejs\n
" sudo npm install -g vscode-json-languageserver\n
" sudo npm install -g vscode-html-languageserver-bin\n
" sudo npm install -g vim-language-server\n

lua << EOF
    require'lspconfig'.pyright.setup{}
    require'lspconfig'.bashls.setup{}
    require'lspconfig'.cmake.setup{}
    require'lspconfig'.vimls.setup{}
    require'lspconfig'.yamlls.setup{}
    require'lspconfig'.dockerls.setup{}
    require'lspconfig'.jsonls.setup{}
    require'lspconfig'.html.setup{}
    require'lspconfig'.ccls.setup{}
EOF
