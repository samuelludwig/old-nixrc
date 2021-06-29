local packer = require('packer')
local vim = require('vim')
return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function() require'statusline' end,
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use {
    'vimwiki/vimwiki',
    config = function()
      vim.api.nvim_exec(
        [[
        "Autopopulate the header of every new vimwiki file
        let g:vimwiki_auto_header=1

        "Convenient splits
        nmap <Leader>we <Plug>VimwikiSplitLink
        nmap <Leader>wq <Plug>VimwikiVSplitLink

        "Easy access to my buffer file
        nmap <Leader>c :split ~/vimwiki/Buffer.wiki<Enter>
        ]], false)
    end
  }

  -- Pretty Colors
  use 'tjdevries/colorbuddy.vim'

  use 'rktjmp/lush.nvim'
  use 'ayu-theme/ayu-vim'
  use 'briones-gabriel/darcula-solid.nvim'
  use 'arcticicestudio/nord-vim'
  use 'morhetz/gruvbox'
  use {
    'joshdick/onedark.vim',
    config = function()
      vim.api.nvim_exec(
        [[
        Hide ~'s
        let g:onedark_hide_endofbuffer = 1

        "Enable italics
        let g:onedark_terminal_italics = 1
        ]], false)
    end
  }
  use {
    'overcache/NeoSolarized',
    config = function()
      vim.api.nvim_exec(
        [[
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
        ]], false)
    end
  }
  use 'kamwitsta/flatwhite-vim'

  use {
    'michal-h21/vim-zettel',
    config = function()
      vim.api.nvim_exec(
        [[
        " Add necessary stuff to vimkikis path
        let g:vimwiki_list = [{'path':'~/scratchbox/vimwiki/markdown/','ext':'.md', 'syntax':'markdown'}, {"path":"~/scratchbox/vimwiki/wiki/"}]

        " Use ripgrep instead of silver-searcher for searching
        let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always"

        " -- TITLES --
        " Change timestamp format to a 4-digit year
        "let g:zettel_format = "%Y%m%d%H%M-%title"

        " Change timestamp format to a 4-digit year and use ID-only for filenames
        let g:zettel_format = "%Y%m%d%H%M"
        ]], false)
    end
  }
  use {
    'SirVer/ultisnips',
    config = function()
      vim.api.nvim_exec(
        [[
        " Trigger configuration. You need to change this to something else
        " than <tab> if you use https://github.com/Valloric/YouCompleteMe.
        let g:UltiSnipsExpandTrigger="<tab>"
        let g:UltiSnipsJumpForwardTrigger="<c-s>"
        let g:UltiSnipsJumpBackwardTrigger="<c-a>"

        " If you want :UltiSnipsEdit to split your window.
        "let g:UltiSnipsEditSplit="vertical"
        ]])
    end
  }
  use 'honza/vim-snippets'

  use 'tpope/vim-surround'
  use 'b3nj5m1n/kommentary'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' }
  }

  use { 'neovim/lsp-config', config = function() require('lsp.config') end }
  use { 'stevearc/aerial.nvim', requires = { 'neovim/lsp-config' } }
end)
