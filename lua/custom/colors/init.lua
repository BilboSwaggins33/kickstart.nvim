return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup {
        style = 'storm', -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
        },
        on_highlights = function(hl, c)
          local prompt = '#2d3149'
          hl.TelescopeNormal = {
            bg = c.bg_dark,
            fg = c.fg_dark,
          }
          hl.TelescopeBorder = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
          hl.TelescopePromptNormal = {
            bg = prompt,
          }
          hl.TelescopePromptBorder = {
            bg = prompt,
            fg = prompt,
          }
          hl.TelescopePromptTitle = {
            bg = prompt,
            fg = prompt,
          }
          hl.TelescopePreviewTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
          hl.TelescopeResultsTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
          hl.HarpoonWindow = {
            bg = c.bg_dark,
          }
          hl.HarpoonBorder = {
            bg = c.bg_dark,
          }
          hl.FloatTitle = {
            bg = c.bg_dark,
            fg = c.green2,
          }
          hl.FloatBorder = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
        end,
      }
    end,
  },
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    config = function()
      require('nightfox').setup {
        options = {
          styles = {
            comments = 'italic',
            keywords = 'bold',
            types = 'italic,bold',
          },
        },
        groups = {
          all = {
            TelescopeBorder = { fg = 'palette.bg0', bg = 'palette.bg0' },

            TelescopeNormal = { fg = 'palette.fg3', bg = 'palette.bg0' },
            TelescopeSelection = { fg = 'palette.fg1', bg = 'palette.sel0' },
            TelescopeSelectionCaret = { fg = 'palette.red', bg = 'palette.sel0' },
            TelescopeMultiSelection = { fg = 'palette.fg1', bg = 'palette.sel1' },

            TelescopeTitle = { fg = 'palette.bg1', bg = 'palette.magenta' },
            TelescopePromptTitle = { fg = 'palette.bg1', bg = 'palette.green' },
            TelescopePreviewTitle = { fg = 'palette.bg1', bg = 'palette.orange' },

            TelescopePromptNormal = { fg = 'palette.fg1', bg = 'palette.bg2' },
            TelescopePromptBorder = { fg = 'palette.bg2', bg = 'palette.bg2' },

            HarpoonWindow = { bg = 'palette.bg0', fg = 'palette.fg2' },
            HarpoonBorder = { bg = 'palette.bg0', fg = 'palette.orange' },

            FloatTitle = { bg = 'palette.bg0', fg = 'palette.pink' },
            FloatBorder = { bg = 'palette.bg0', fg = 'palette.bg0' },
          },
        },
      }
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        highlight_overrides = {
          mocha = function(mocha)
            return {
              TelescopeBorder = { fg = mocha.mantle, bg = mocha.mantle },
              TelescopeNormal = { fg = mocha.surface1, bg = mocha.mantle },
              TelescopeSelection = { fg = mocha.text, bg = mocha.base },
              TelescopeSelectionCaret = { fg = mocha.teal, bg = mocha.surface0 },
              TelescopeMultiSelection = { fg = mocha.text, bg = mocha.surface1 },

              TelescopeTitle = { fg = mocha.base, bg = mocha.red },
              TelescopePromptTitle = { fg = mocha.base, bg = mocha.mauve },
              TelescopePreviewTitle = { fg = mocha.base, bg = mocha.peach },

              TelescopePromptNormal = { fg = mocha.text, bg = mocha.surface0 },
              TelescopePromptBorder = { fg = mocha.surface0, bg = mocha.surface0 },
              HarpoonWindow = { bg = mocha.mantle, fg = mocha.text },
              HarpoonBorder = { bg = mocha.mantle, fg = mocha.rosewater },

              FloatTitle = { bg = mocha.mantle, fg = mocha.mauve },
              FloatBorder = { bg = mocha.mantle, fg = mocha.mantle },
            }
          end,
        },
      }
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    config = function()
      require('rose-pine').setup {
        variant = 'moon',
        highlight_groups = {
          TelescopeBorder = { fg = 'overlay', bg = 'overlay' },
          TelescopeNormal = { fg = 'subtle', bg = 'overlay' },
          TelescopeSelection = { fg = 'text', bg = 'highlight_med' },
          TelescopeSelectionCaret = { fg = 'love', bg = 'highlight_med' },
          TelescopeMultiSelection = { fg = 'text', bg = 'highlight_high' },

          TelescopeTitle = { fg = 'base', bg = 'love' },
          TelescopePromptTitle = { fg = 'base', bg = 'pine' },
          TelescopePreviewTitle = { fg = 'base', bg = 'iris' },

          TelescopePromptNormal = { fg = 'text', bg = 'surface' },
          TelescopePromptBorder = { fg = 'surface', bg = 'surface' },
          HarpoonWindow = { bg = 'surface', fg = 'subtle' },
          HarpoonBorder = { bg = 'surface', fg = 'iris' },
          FloatTitle = { bg = 'surface', fg = 'iris' },
          FloatBorder = { bg = 'surface', fg = 'surface' },
        },
      }
    end,
  },
  { 'diegoulloao/neofusion.nvim', priority = 1000 },
  { 'mellow-theme/mellow.nvim', priority = 1000 },
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_background = 'hard'
      -- 'soft medium hard'
      vim.g.gruvbox_material_foreground = 'material'
      --'material mix original'
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      require('kanagawa').setup {
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = 'none',
              },
            },
          },
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            NormalFloat = { bg = 'none' },
            FloatBorder = { bg = 'none' },
            FloatTitle = { bg = 'none' },

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            HarpoonWindow = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            HarpoonBorder = { bg = theme.ui.bg_m3 },
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = theme.ui.bg_p1 },
            TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
            TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
            TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
          }
        end,
      }
    end,
    init = function()
      -- Load the colorscheme here. Options:
      -- 'tokyonight-night', 'tokyonight-storm', 'tokyonight-moon', 'tokyonight-day'.
      -- 'catppuccin-mocha', 'catppuccin-macchiato', 'catppuccin-frappe'.
      -- 'nightfox', 'duskfox', 'nordfox'.
      -- 'rose-pine', variant = 'moon, main' - setup'.
      -- 'kanagawa-wave', 'kanagawa-dragon'.
      -- 'neofusion', 'mellow'
      -- 'gruvbox-material'
      vim.cmd.colorscheme 'tokyonight-night'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
