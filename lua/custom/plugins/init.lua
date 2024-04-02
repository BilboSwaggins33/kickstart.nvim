-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    config = function()
      -- Setup orgmode
      require('orgmode').setup {
        org_agenda_files = '~/az.org',
        org_default_notes_file = '~/az.org',
      }
    end,
  },
  { 'mbbill/undotree' },
  {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
      local mark = require 'harpoon.mark'
      local ui = require 'harpoon.ui'

      vim.keymap.set('n', '<leader>a', mark.add_file)
      vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

      vim.keymap.set('n', '<leader>1', function()
        ui.nav_file(1)
      end)
      vim.keymap.set('n', '<leader>2', function()
        ui.nav_file(2)
      end)
      vim.keymap.set('n', '<leader>3', function()
        ui.nav_file(3)
      end)
      vim.keymap.set('n', '<leader>4', function()
        ui.nav_file(4)
      end)
    end,
  },
  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup {
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>' },
        stop_eof = true,
        cursor_scrolls_alone = true,
        hide_cursor = false,
        performance_mode = true,
      }
      local t = {}
      t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '100' } }
      t['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '100' } }
      t['<C-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '200' } }
      t['<C-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '200' } }
      require('neoscroll.config').set_mappings(t)
    end,
  },

  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      local ascii = {
        [[]],
        [[]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⢠⠏⡆⠀⠀⠀⠀⠀⢀⣀⣤⣤⣤⣀⡀ ]],
        [[⠀⠀⠀⠀⠀⡟⢦⡀ ⠀⠀⣀⠞⠀⠀⠘⡀⢀⡠⠚⣉⠤⠂⠀⠀⠀⠈⠙⢦⡀ ]],
        [[⠀⠀⠀⠀⠀⡇⠀⠉⠒⠊⠁⠀⠀⠀⠀⠀⠘⢧⠔⣉⠤⠒⠒⠉⠉⠀⠀⠀⠀⠹⣆ ]],
        [[⠀⠀⠀⠀⠀⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⠀⠀⣤⠶⠶⢶⡄⠀⠀⠀⠀⢹ ]],
        [[⠀⣀⠤⠒⠒⢺⠒⠀⠀⠀⠀⠀⠀⠀⠀⠤⠊⠀⢸⠀⡿⠀⡀⠀⣀⡟⠀⠀⠀⠀⢸⡇ ]],
        [[⠈⠀⠀⣠⠴⠚⢯⡀⠐⠒⠚⠉⠀⢶⠂⠀⣀⠜⠀⢿⡀⠉⠚⠉⠀⠀⠀⠀⣠⠟ ]],
        [[⠀⠠⠊⠀⠀⠀⠀⠙⠂⣴⠒⠒⣲⢔⠉⠉⣹⣞⣉⣈⠿⢦⣀⣀⣀⣠⡴⠟ ]],
        [[]],
        [[]],
      }

      require('dashboard').setup {
        theme = 'hyper',
        config = {
          header = ascii,
          shortcut = {
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              icon = '🔎 ',
              icon_hl = '@variable',
              desc = 'Search Files',
              group = 'DiagnosticHint',
              action = 'Telescope live_grep',
              key = 's',
            },
            {
              desc = 'Edit Config',
              group = 'Number',
              action = 'edit ~/.config/nvim/init.lua',
              key = 'e',
            },
          },
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
  { 'tpope/vim-fugitive' },
  {
    'eandrju/cellular-automaton.nvim',
  },
}
