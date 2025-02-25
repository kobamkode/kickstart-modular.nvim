-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
    keys = {
      { '-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
    },
  },
  {
    'ohakutsu/socks-copypath.nvim',
    config = function()
      require('socks-copypath').setup()
    end,
  },
  {
    'yutkat/confirm-quit.nvim',
    event = 'CmdlineEnter',
    opts = {},
  },
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    lazy = false,
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      workspaces = {
        {
          name = 'devlog',
          path = '/home/mario/Codes/devlog/',
          strict = true,
        },
      },
      notes_subdir = '+',
      new_notes_location = 'notes_subdir',
      templates = {
        folder = 'x/templates',
      },
      follow_url_func = function(url)
        vim.fn.jobstart { 'xdg-open', url } -- linux
      end,
      mappings = {
        ['<cr>'] = {
          action = function()
            return require('obsidian').util.smart_action()
          end,
          opts = { buffer = true, expr = true },
        },
      },
    },
  },
}
