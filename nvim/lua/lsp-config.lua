-- pip3 install python-language-server
-- require'lspconfig'.pyls.setup{}
-- npm install -g pyright
require'lspconfig'.pyright.setup{}
-- npm install -g typescript typescript-language-server
require'lspconfig'.tsserver.setup{}
-- npm i -g vscode-langservers-extracted
require'lspconfig'.html.setup{}
-- npm install -g vscode-css-languageserver-bin
require'lspconfig'.cssls.setup{}
-- npm install -g vscode-json-languageserver
require'lspconfig'.jsonls.setup{}
