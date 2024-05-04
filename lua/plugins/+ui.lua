return {
  {
    "goolord/alpha-nvim",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = {
        [[                               __                ]],
        [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
        [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
        [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
        [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
      }
      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
        dashboard.button("r", "↺  Recently used files", ":Telescope oldfiles <CR>"),
        dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
        dashboard.button("q", "𝐐  Quit Neovim", ":qa<CR>"),
      }

      local function footer()
        return "All Abandon Hope, Ye Who Enter Here"
      end

      dashboard.section.footer.val = footer()

      dashboard.section.footer.opts.hl = "Type"
      dashboard.section.header.opts.hl = "Include"
      dashboard.section.buttons.opts.hl = "Keyword"

      dashboard.opts.opts.noautocmd = true
      alpha.setup(dashboard.opts)
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      local telescope = require("telescope")
      local project = require("project_nvim")
      project.setup({
        active = true,
        on_config = nil,
        manual_mode = false,
        detection_methods = { "pattern" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
        show_hidden = true,
        silent_chdir = true,
        ignore_lsp = {},
        datapath = vim.fn.stdpath("data"),
      })
      telescope.load_extension("projects")
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = false, -- use a classic bottom cmdline for search
          command_palette = false, -- position the cmdline and popupmenu together
          long_message_to_split = false, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },
        cmdline = {
          view = "cmdline",
          format = {
            -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
            -- view: (default is cmdline view)
            -- opts: any options passed to the view
            -- icon_hl_group: optional hl_group for the icon
            -- title: set to anything or empty string to hide
            cmdline = { pattern = "^:", icon = "", lang = "vim" },
            search_down = { kind = "search", pattern = "^/", icon = "  ", lang = "regex" },
            search_up = { kind = "search", pattern = "^%?", icon = "  ", lang = "regex" },
            filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
            lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
            help = { pattern = "^:%s*he?l?p?%s+", icon = "?" },
            input = {}, -- Used by input()
            -- lua = false, -- to disable a format, set to `false`
          },
        },
        messages = {
          -- NOTE: If you enable messages, then the cmdline is enabled automatically.
          -- This is a current Neovim limitation.
          enabled = false, -- enables the Noice messages UI
        },
        notify = {
          enabled = false,
        },
      })
    end,
  },
  {
    "rcarriga/nvim-notify", -- tree view
    config = function()
      require("notify").setup({
        background_colour = "#000000",
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim", -- status line
    config = function()
      local lualine = require("lualine")
      local icons = require("config.icons")

      -- Credited to [evil_lualine](https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/evil_lualine.lua)
      local conditions = {
        buffer_not_empty = function()
          return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
        end,
        hide_in_width = function()
          return vim.fn.winwidth(0) > 80
        end,
      }

      -- stylua: ignore start
      local colors = {
        normal = {
          bg       = "#202328",
          fg       = "#bbc2cf",
          yellow   = "#ECBE7B",
          cyan     = "#008080",
          darkblue = "#081633",
          green    = "#98be65",
          orange   = "#FF8800",
          violet   = "#a9a1e1",
          magenta  = "#c678dd",
          blue     = "#51afef",
          red      = "#ec5f67",
        },
        nightfly = {
          bg       = "#2e3440",
          fg       = "#cbced2",
          yellow   = "#ecc48d",
          cyan     = "#7fdbca",
          darkblue = "#82aaff",
          green    = "#21c7a8",
          orange   = "#e3d18a",
          violet   = "#a9a1e1",
          magenta  = "#ae81ff",
          blue     = "#82aaff	",
          red      = "#ff5874",
        },
        kanagawa = {
          bg       = "#16161D",
          fg       = "#C8C093",
          yellow   = "#ecc48d",
          cyan     = "#7fdbca",
          darkblue = "#82aaff",
          green    = "#21c7a8",
          orange   = "#e3d18a",
          violet   = "#a9a1e1",
          magenta  = "#ae81ff",
          blue     = "#82aaff	",
          red      = "#ff5874",
        },
        catppuccin_mocha = {
          bg       = "#1E1E2E",
          fg       = "#CDD6F4",
          yellow   = "#F9E2AF",
          cyan     = "#7fdbca",
          darkblue = "#89B4FA",
          green    = "#A6E3A1",
          orange   = "#e3d18a",
          violet   = "#a9a1e1",
          magenta  = "#ae81ff",
          blue     = "#89B4FA",
          red      = "#F38BA8",
        }
      }

      local diagnostics = {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = icons.diagnostics.Error, warn = icons.diagnostics.Warning, info = icons.diagnostics.Information },
        colored = true,
        update_in_insert = false,
        always_visible = true,
      }

      local mode = {
        "mode",
        fmt = function(str)
          return str
        end,
      }

      local branch = {
        "branch",
        icon = icons.git.Branch,
        color = { gui = "bold" },
      }

      local diff = {
        "diff",
        symbols = { added = icons.git.Add, modified = icons.git.Mod, removed = icons.git.Remove },
        diff_color = {
          added = { fg = colors.green },
          modified = { fg = colors.orange },
          removed = { fg = colors.red },
        },
        cond = conditions.hide_in_width,

      }

      local filetype = {
        "filetype",
        icons_enabled = true,
        icon = nil,
      }

      local filename = {
        "filename",
        cond = conditions.buffer_not_empty,
        color = { fg = colors.magenta, gui = "bold" },
      }

      local encoding = {
        "o:encoding",
        fmt = string.upper,
        cond = conditions.hide_in_width,
        color = { fg = colors.green, gui = "bold" },
      }

      local fileformat = {
        "fileformat",
        fmt = string.upper,
        icons_enabled = false,
        color = { gui = "bold" },
      }

      local location = {
        "location",
        padding = 2,
      }

      local lsp_name = {
        function()
          -- From Nvchad
          if rawget(vim, "lsp") then
            for _, client in ipairs(vim.lsp.get_active_clients()) do
              if client.attached_buffers[vim.api.nvim_get_current_buf()] then
                return (vim.o.columns > 100 and "   LSP: " .. client.name .. "  ") or "   LSP  "
              end
            end
          end
        end,
        cond = function()
          return rawget(vim, "lsp") ~= nil
        end,
        color = { fg = colors.orange, gui = "bold" }
      }

      colors = colors.kanagawa

      local config = {
        options = {
          icons_enabled = true,
          global_status = true,
          component_separators = "",
          section_separators = "",
          disabled_filetypes = { "alpha", "dashboard", "Outline", "NvimTree", "Outline" },
          always_divide_middle = true,
          theme = "kanagawa",
        },
        sections = {
          lualine_a = { mode },
          lualine_b = { branch, diff, diagnostics },
          lualine_y = {},
          lualine_z = { location },
          lualine_c = { filename, { filestatus = true } },
          lualine_x = { encoding, fileformat, filetype, lsp_name },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          lualine_c = { filename },
          lualine_x = { location },
        },
        tabline = {},
        extensions = { "quickfix", "nvim-tree" },
      }
		  lualine.setup(config)
    end,
  },
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local barbar = require("barbar")
      vim.g.barbar_auto_setup = false
      barbar.setup({
        opts = {},
      })
    end,
  },
  {
    "m-demare/hlargs.nvim",
    config = function()
      local hlargs = require("hlargs")

      hlargs.setup({
        color = "#ef9062",
        highlight = {},
        excluded_filetypes = {},
        paint_arg_declarations = true,
        paint_arg_usages = true,
        paint_catch_blocks = {
          declarations = false,
          usages = false,
        },
        extras = {
          named_parameters = false,
        },
        hl_priority = 10000,
        excluded_argnames = {
          declarations = {},
          usages = {
            python = { "self", "cls" },
            lua = { "self" },
          },
        },
        performance = {
          parse_delay = 1,
          slow_parse_delay = 50,
          max_iterations = 400,
          max_concurrent_partial_parses = 30,
          debounce = {
            partial_parse = 3,
            partial_insert_mode = 100,
            total_parse = 700,
            slow_parse = 5000,
          },
        },
      })
      -- (You may omit the settings whose defaults you're ok with)
    end,
  },
  {
    "stevearc/dressing.nvim",
    config = function()
      local dressing = require("dressing")
      dressing.setup({
        require("dressing").setup({
          input = {
            -- Set to false to disable the vim.ui.input implementation
            enabled = true,

            -- Default prompt string
            default_prompt = "Input:",

            -- Can be 'left', 'right', or 'center'
            title_pos = "left",

            -- When true, <Esc> will close the modal
            insert_only = true,

            -- When true, input will start in insert mode.
            start_in_insert = true,

            -- These are passed to nvim_open_win
            border = "rounded",
            -- 'editor' and 'win' will default to being centered
            relative = "cursor",

            -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
            prefer_width = 40,
            width = nil,
            -- min_width and max_width can be a list of mixed types.
            -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
            max_width = { 140, 0.9 },
            min_width = { 20, 0.2 },

            buf_options = {},
            win_options = {
              -- Window transparency (0-100)
              winblend = 10,
              -- Disable line wrapping
              wrap = false,
              -- Indicator for when text exceeds window
              list = true,
              listchars = "precedes:…,extends:…",
              -- Increase this for more context when text scrolls off the window
              sidescrolloff = 0,
            },

            -- Set to `false` to disable
            mappings = {
              n = {
                ["<Esc>"] = "Close",
                ["<CR>"] = "Confirm",
              },
              i = {
                ["<C-c>"] = "Close",
                ["<CR>"] = "Confirm",
                ["<Up>"] = "HistoryPrev",
                ["<Down>"] = "HistoryNext",
              },
            },

            override = function(conf)
              -- This is the config that will be passed to nvim_open_win.
              -- Change values here to customize the layout
              return conf
            end,

            -- see :help dressing_get_config
            get_config = nil,
          },
          select = {
            -- Set to false to disable the vim.ui.select implementation
            enabled = true,

            -- Priority list of preferred vim.select implementations
            backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },

            -- Trim trailing `:` from prompt
            trim_prompt = true,

            -- Options for telescope selector
            -- These are passed into the telescope picker directly. Can be used like:
            -- telescope = require('telescope.themes').get_ivy({...})
            telescope = nil,

            -- Options for fzf selector
            fzf = {
              window = {
                width = 0.5,
                height = 0.4,
              },
            },

            -- Options for fzf-lua
            fzf_lua = {
              -- winopts = {
              --   height = 0.5,
              --   width = 0.5,
              -- },
            },

            -- Options for nui Menu
            nui = {
              position = "50%",
              size = nil,
              relative = "editor",
              border = {
                style = "rounded",
              },
              buf_options = {
                swapfile = false,
                filetype = "DressingSelect",
              },
              win_options = {
                winblend = 10,
              },
              max_width = 80,
              max_height = 40,
              min_width = 40,
              min_height = 10,
            },

            -- Options for built-in selector
            builtin = {
              -- Display numbers for options and set up keymaps
              show_numbers = true,
              -- These are passed to nvim_open_win
              border = "rounded",
              -- 'editor' and 'win' will default to being centered
              relative = "editor",

              buf_options = {},
              win_options = {
                -- Window transparency (0-100)
                winblend = 10,
                cursorline = true,
                cursorlineopt = "both",
              },

              -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
              -- the min_ and max_ options can be a list of mixed types.
              -- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
              width = nil,
              max_width = { 140, 0.8 },
              min_width = { 40, 0.2 },
              height = nil,
              max_height = 0.9,
              min_height = { 10, 0.2 },

              -- Set to `false` to disable
              mappings = {
                ["<Esc>"] = "Close",
                ["<C-c>"] = "Close",
                ["<CR>"] = "Confirm",
              },

              override = function(conf)
                -- This is the config that will be passed to nvim_open_win.
                -- Change values here to customize the layout
                return conf
              end,
            },

            -- Used to override format_item. See :help dressing-format
            format_item_override = {},

            -- see :help dressing_get_config
            get_config = nil,
          },
        }),
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      local ibl = require("ibl")
      ibl.setup()
    end,
  },
}
