" vi: ft=vim:tw=72:fdm=marker

" Declare Plugins
" ---------------
call plug#begin(stdpath('data') . '/plugged')
"Vim-Polyglot - Syntax highlighting for a bunch of filetypes -- DISABLED {{{
"Plug 'sheerun/vim-polyglot'
"}}}
"Vimwiki - A proper exocortex {{{
Plug 'vimwiki/vimwiki'

"Autopopulate the header of every new vimwiki file
let g:vimwiki_auto_header=1

"Convenient splits
nmap <Leader>we <Plug>VimwikiSplitLink
nmap <Leader>wq <Plug>VimwikiVSplitLink

"Easy access to my buffer file
nmap <Leader>c :split ~/vimwiki/Buffer.wiki<Enter>
"}}}
" Unison syntax support -- DISABLED {{{
" Plug 'unisonweb/unison', { 'rtp': 'editor-support/vim' }
" }}}
" lush - Lua-powered colorscheme-builder tools {{{
Plug 'rktjmp/lush.nvim'
" }}}
" ayu colorscheme {{{
Plug 'ayu-theme/ayu-vim'
" }}}
" Darcula-solid colorscheme {{{
Plug 'briones-gabriel/darcula-solid.nvim'
" }}}
"Nordic colorscheme {{{
Plug 'arcticicestudio/nord-vim'
"}}}
"Gruvbox colorscheme {{{
Plug 'morhetz/gruvbox'
"}}}
"Onedark colorscheme {{{
Plug 'joshdick/onedark.vim'

"if x == 'onedark'
    "Hide ~'s
    let g:onedark_hide_endofbuffer = 1

    "Enable italics
    let g:onedark_terminal_italics = 1
"endif
"}}}
"{{{Snow colorscheme
Plug 'nightsense/snow'
"}}}
"Pink-Moon colorscheme {{{
Plug 'sts10/vim-pink-moon'
"}}}
"NeoSolarized colorscheme {{{
Plug 'overcache/NeoSolarized'

"if :colorscheme == 'NeoSolarized'
    " Default value is "normal", Setting this option to "high" or "low" does
    " use the same Solarized palette but simply shifts some values up or
    " down in order to expand or compress the tonal range displayed.
    let g:neosolarized_contrast = "normal"

    " Special characters such as trailing whitespace, tabs, newlines, when
    " displayed using ":set list" can be set to one of three levels
    " depending on your needs.  Default value is "normal". Provide "high"
    " and "low" options.
    let g:neosolarized_visibility = "normal"

    " I make vertSplitBar a transparent background color. If you like the
    " origin solarized vertSplitBar style more, set this value to 0.
    let g:neosolarized_vertSplitBgTrans = 1

    " If you wish to enable/disable NeoSolarized from displaying bold,
    " underlined or italicized" typefaces, simply assign 1 or 0 to the
    " appropriate variable.  Default values:
    let g:neosolarized_bold = 1
    let g:neosolarized_underline = 1
    let g:neosolarized_italic = 0

    " Used to enable/disable "bold as bright" in Neovim terminal. If colors
    " of bold text output by commands like `ls` aren't what you expect, you
    " might want to try disabling this option. Default value:
    let g:neosolarized_termBoldAsBright = 1
"endif
"}}}
" Paper-color colortheme {{{
Plug 'NLKNguyen/papercolor-theme'

"if :colorscheme == 'PaperColor'
    let g:PaperColor_Theme_Options = {
      \   'theme': {
      \     'default': {
      \       'transparent_background': 0
      \     }
      \   }
      \ }
    " All options can be found here `https://github.com/NLKNguyen/papercolor-theme`
"endif
"}}}
" Pencil colorscheme {{{
Plug 'reedes/vim-colors-pencil'
" }}}
" fzf - Fuzzy-finder {{{
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" }}}
" fzf.vim - fzf functions {{{
Plug 'junegunn/fzf.vim'
" }}}
" Flatwhite colorscheme {{{
Plug 'kamwitsta/flatwhite-vim'
" }}}
" vim-zettel - A Zettelkasten layer on top of vimwiki {{{
Plug 'michal-h21/vim-zettel'

" Add necessary stuff to vimkikis path
let g:vimwiki_list = [{'path':'~/scratchbox/vimwiki/markdown/','ext':'.md', 'syntax':'markdown'}, {"path":"~/scratchbox/vimwiki/wiki/"}]

" Use ripgrep instead of silver-searcher for searching
let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always"

" -- TITLES --
" Change timestamp format to a 4-digit year
"let g:zettel_format = "%Y%m%d%H%M-%title"

" Change timestamp format to a 4-digit year and use ID-only for filenames
let g:zettel_format = "%Y%m%d%H%M"
" }}}
" UltiSnips - Ultimate snippets solution for (neo)vim {{{

" Track the engine
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Trigger configuration. You need to change this to something else
" than <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-s>"
let g:UltiSnipsJumpBackwardTrigger="<c-a>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" }}}
" vim-surround - (Helpful) {{{
Plug 'tpope/vim-surround'
" }}}
" neomake - async linting and make framework -- DISABLED {{{
"Plug 'neomake/neomake'
" }}}
" SnipRun - Run a snippet of code in vim {{{
"Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
" }}}
" nvim-lspconfig - Configure the Neovim LSP client  {{{
"Plug 'neovim/nvim-lspconfig'
" }}}
" aniseed - Enable Fennel-power for neovim configs {{{
Plug 'Olical/aniseed', { 'tag': 'v3.18.0' }
" }}}
" conjure - Interactive environment for code evaluation (only lisps allowed for now...) {{{
Plug 'Olical/conjure', {'tag': 'v4.19.0'}
" }}}
" nvim-treesitter - {{{
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " update the parsers on update
" }}}
" telescope - fuzzy file searcher {{{
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" }}}
" nvim-lspconfig - Language servers {{{
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
" }}}
" galaxyline - Lua-powered statusline {{{
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons' " <- For icons
" }}}
" kommentary - Lua-powered commenting {{{
Plug 'b3nj5m1n/kommentary'
" }}}

call plug#end()

" Post-install Plugin Configuration
" ---------------------------------
" Neomake {{{
" Run neomake when writing or reading a buffer, and on changes in
" insert and normal mode (after 500ms; no delay when writing).
"call neomake#configure#automake('nrwi', 500)
" }}}
" aniseed {{{
let g:aniseed#env = v:true
" }}}
" nvim-treesitter {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
    ignore_install = { }, -- List of parsers to ignore installing
    highlight = {
        enable = true,              -- false will disable the whole extension
        -- disable = { "c", "rust" },  -- list of language that will be disabled
        disable = { },  -- list of language that will be disabled
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    indent = {
        enable = true,
        disable = { }
    },
}
EOF
" }}}
" nvim-lspconfig {{{
lua <<EOF
local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
EOF

" Keybinds
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "intelephense" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF
" }}}
" ayu {{{
"let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
" }}}
" galaxyline {{{
" }}}
