return {
  {
    'epwalsh/obsidian.nvim',
    enabled = false,
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
