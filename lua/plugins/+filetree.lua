return {
  "nvim-tree/nvim-tree.lua", -- tree view
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-web-devicons").setup({
      -- your personnal icons can go here (to override)
      -- you can specify color or cterm_color instead of specifying both of them
      -- DevIcon will be appended to `name`
      override = {
        toml = {
          icon = "",
          color = "#428850",
          cterm_color = "65",
          name = "Toml",
        },
      },
      -- globally enable different highlight colors per icon (default to true)
      -- if set to false all icons will have the default icon's color
      color_icons = true,
      -- globally enable default icons (default to false)
      -- will get overriden by `get_icons` option
      default = true,
      -- globally enable "strict" selection of icons - icon will be looked up in
      -- different tables, first by filename, and if not found by extension; this
      -- prevents cases when file doesn't have any extension but still gets some icon
      -- because its name happened to match some extension (default to false)
      strict = true,
      -- same as `override` but specifically for overrides by filename
      -- takes effect when `strict` is true
      override_by_filename = {
        [".gitignore"] = {
          icon = "",
          color = "#f1502f",
          name = "Gitignore",
        },
      },
      -- same as `override` but specifically for overrides by extension
      -- takes effect when `strict` is true
      override_by_extension = {
        ["toml"] = {
          icon = "",
          color = "#81e043",
          name = "Toml",
        },
      },
    })

    -- following options are the default
    -- each of these are documented in `:help nvim-tree.OPTION_NAME`
    local nvim_tree = require("nvim-tree")
    local icons = require("config.icons")

    --
    -- This function has been generated from your
    --   view.mappings.list
    --   view.mappings.custom_only
    --   remove_keymaps
    --
    -- You should add this function to your configuration and set on_attach = on_attach in the nvim-tree setup call.
    --
    -- Although care was taken to ensure correctness and completeness, your review is required.
    --
    -- Please check for the following issues in auto generated content:
    --   "Mappings removed" is as you expect
    --   "Mappings migrated" are correct
    --
    -- Please see https://github.com/nvim-tree/nvim-tree.lua/wiki/Migrating-To-on_attach for assistance in migrating.
    --

    local function on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- Default mappings. Feel free to modify or remove as you wish.
      --
      -- BEGIN_DEFAULT_ON_ATTACH
      vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
      vim.keymap.set("n", "<C-e>", api.node.open.replace_tree_buffer, opts("Open: In Place"))
      vim.keymap.set("n", "<C-k>", api.node.show_info_popup, opts("Info"))
      vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
      vim.keymap.set("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
      vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
      vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
      vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
      vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
      vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
      vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
      vim.keymap.set("n", ".", api.node.run.cmd, opts("Run Command"))
      vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("Up"))
      vim.keymap.set("n", "a", api.fs.create, opts("Create"))
      vim.keymap.set("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
      vim.keymap.set("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle No Buffer"))
      vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
      vim.keymap.set("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Git Clean"))
      vim.keymap.set("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
      vim.keymap.set("n", "]c", api.node.navigate.git.next, opts("Next Git"))
      vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
      vim.keymap.set("n", "D", api.fs.trash, opts("Trash"))
      vim.keymap.set("n", "E", api.tree.expand_all, opts("Expand All"))
      vim.keymap.set("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
      vim.keymap.set("n", "]e", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
      vim.keymap.set("n", "[e", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
      vim.keymap.set("n", "F", api.live_filter.clear, opts("Clean Filter"))
      vim.keymap.set("n", "f", api.live_filter.start, opts("Filter"))
      vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))
      vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
      vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
      vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
      vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
      vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
      vim.keymap.set("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
      vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "O", api.node.open.no_window_picker, opts("Open: No Window Picker"))
      vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
      vim.keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
      vim.keymap.set("n", "q", api.tree.close, opts("Close"))
      vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
      vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
      vim.keymap.set("n", "s", api.node.run.system, opts("Run System"))
      vim.keymap.set("n", "S", api.tree.search_node, opts("Search"))
      vim.keymap.set("n", "U", api.tree.toggle_custom_filter, opts("Toggle Hidden"))
      vim.keymap.set("n", "W", api.tree.collapse_all, opts("Collapse"))
      vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
      vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
      vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
      vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
      -- END_DEFAULT_ON_ATTACH

      -- Mappings migrated from view.mappings.list
      --
      -- You will need to insert "your code goes here" for any mappings with a custom action_cb
      vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
      vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
    end

    nvim_tree.setup({
      sort_by = "case_sensitive",
      auto_reload_on_write = true,
      disable_netrw = true,
      hijack_netrw = true,
      open_on_tab = false,
      hijack_cursor = false,
      update_cwd = true,
      diagnostics = {
        enable = true,
        icons = {
          hint = icons.diagnostics.Hint,
          info = icons.diagnostics.Information,
          warning = icons.diagnostics.Warning,
          error = icons.diagnostics.Error,
        },
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
        update_root = true,
        ignore_list = {},
      },
      system_open = {
        cmd = nil,
        args = {},
      },
      filters = {
        dotfiles = false,
        custom = {},
      },
      git = {
        enable = true,
        ignore = false,
        timeout = 500,
      },
      view = {
        width = 30,
        side = "left",
        number = false,
        relativenumber = false,
        preserve_window_proportions = true,
      },
      trash = {
        cmd = "trash",
        require_confirm = true,
      },
      renderer = {
        indent_markers = {
          enable = true,
          icons = {
            corner = "└ ",
            edge = "│ ",
            none = "  ",
          },
        },
        root_folder_modifier = ":t",
        highlight_git = true,
        icons = {
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = true,
          },
          webdev_colors = true,
          git_placement = "before",
          glyphs = {
            default = icons.documents.Unknown,
            symlink = icons.documents.Symlink,
            git = {
              unstaged = icons.ui.TinyCircle,
              staged = icons.git.Add,
              unmerged = icons.git.Unmerged,
              renamed = icons.git.Rename,
              deleted = icons.git.Remove,
              untracked = icons.git.Untrack,
              ignored = "",
            },
            folder = {
              default = icons.documents.Folder,
              open = icons.documents.OpenFolder,
              empty = icons.documents.EmptyFolder,
              empty_open = icons.documents.EmptyOpenFolder,
              symlink = icons.documents.FolderSymlink,
            },
          },
        },
      },
      actions = {
        use_system_clipboard = true,
        change_dir = {
          enable = true,
          global = true,
          restrict_above_cwd = false,
        },
        open_file = {
          resize_window = true,
          quit_on_open = false,
          window_picker = {
            enable = true,
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = {
              filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
              buftype = { "nofile", "terminal", "help" },
            },
          },
        },
      },
      on_attach = on_attach,
    })
  end,
}
