-- You ca add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    event = 'VimEnter', -- needed for folds to load in time and comments closed
    keys = {
			-- stylua: ignore start
			{ "zm", function() require("ufo").closeAllFolds() end, desc = "󱃄 Close All Folds" },
			{ "zr", function() require("ufo").openFoldsExceptKinds { "comment", "imports" } end, desc = "󱃄 Open All Regular Folds" },
			{ "zR", function() require("ufo").openFoldsExceptKinds {} end, desc = "󱃄 Open All Folds" },
			{ "z1", function() require("ufo").closeFoldsWith(1) end, desc = "󱃄 Close L1 Folds" },
			{ "z2", function() require("ufo").closeFoldsWith(2) end, desc = "󱃄 Close L2 Folds" },
			{ "z3", function() require("ufo").closeFoldsWith(3) end, desc = "󱃄 Close L3 Folds" },
			{ "z4", function() require("ufo").closeFoldsWith(4) end, desc = "󱃄 Close L4 Folds" },
      -- stylua: ignore end
    },
    init = function()
      -- INFO fold commands usually change the foldlevel, which fixes folds, e.g.
      -- auto-closing them after leaving insert mode, however ufo does not seem to
      -- have equivalents for zr and zm because there is no saved fold level.
      -- Consequently, the vim-internal fold levels need to be disabled by setting
      -- them to 99
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
    end,
    opts = {
      provider_selector = function(_, ft, _)
        -- INFO some filetypes only allow indent, some only LSP, some only
        -- treesitter. However, ufo only accepts two kinds as priority,
        -- therefore making this function necessary :/
        local lspWithOutFolding = { 'markdown', 'sh', 'css', 'html', 'python', 'json' }
        if vim.tbl_contains(lspWithOutFolding, ft) then
          return { 'treesitter', 'indent' }
        end
        return { 'lsp', 'indent' }
      end,
      -- when opening the buffer, close these fold kinds
      -- use `:UfoInspect` to get available fold kinds from the LSP
      close_fold_kinds_for_ft = {
        default = { 'imports', 'comment' },
      },
      open_fold_hl_timeout = 800,
      fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
        local hlgroup = 'NonText'
        local newVirtText = {}
        local suffix = '   ' .. tostring(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, hlgroup })
        return newVirtText
      end,
    },
  },
  {
    'kawre/leetcode.nvim',
    build = ':TSUpdate html',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim', -- required by telescope
      'MunifTanjim/nui.nvim',
    },
    opts = {
      -- configuration goes here
    },
  },
  --  {
  --    'NStefan002/donut.nvim',
  --    version = '*',
  --    lazy = false,
  --  },
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
      require('oil').setup {
        columns = {
          'icon',
          'size',
        },
        delete_to_trash = true,
        view_options = {
          show_hidden = true,
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, '.')
          end,
        },
      }
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
      }
    end,
  },
  {
    'nvim-orgmode/orgmode',
    config = function()
      -- Setup orgmode
      require('orgmode').setup {
        org_agenda_files = '~/az.org',
        org_default_notes_file = '~/az.org',
        org_agenda_skip_deadline_if_done = true,
        org_agenda_skip_scheduled_if_done = true,
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
      vim.keymap.set('n', '<leader>5', function()
        ui.nav_file(5)
      end)
      vim.keymap.set('n', '<leader>6', function()
        ui.nav_file(6)
      end)

      require('harpoon').setup {
        menu = {
          borderchars = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
        },
      }
    end,
  },
  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup {
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>' },
        stop_eof = false,
        cursor_scrolls_alone = true,
        hide_cursor = false,
        performance_mode = false,
      }
      local t = {}
      t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '100' } }
      t['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '100' } }
      t['<C-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '150' } }
      t['<C-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '150' } }
      require('neoscroll.config').set_mappings(t)
    end,
  },
  { 'mhinz/vim-startify' },
  { 'tpope/vim-fugitive' },
  {
    'eandrju/cellular-automaton.nvim',
  },
}
