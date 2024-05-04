# CiNvim

A lightweight and fast Neovim code editor built for competitive programming.

## For Whom Is This Editor For?

Anyone who wants to delve into competitive programming needs a neat and fast code editor.
This code editor is an attempt at making precisely that.
Combined with [CompetiTest](https://github.com/xeluxee/competitest.nvim) and other UX enhancing plugins, **CiNvim** strives to deliver a single platform for all your CP problems.
**Fun Fact:** `CiNvim` (pronounced `ci-nvim`) comes from joining `Cin` and `Nvim` ;)

## How to Install

### Prerequisites

1. Neovim >= 0.6
2. `CiNvim` was made for Linux operating systems. It may or may not support Windows.
3. Install a [Nerdfont](https://www.nerdfonts.com/font-downloads) for your terminal. I use [FiraCode Nerd Font](https://github.com/tonsky/FiraCode), which is the default font set in the editor (scroll down to learn to change defaults).
4. Update packages

   ```sh
   sudo apt update
   ```

5. Install `ripgrep` to Text Search:

   ```sh
   sudo apt install ripgrep
   ```

6. Install `lazygit` to integrate Git in the code editor:

   ```sh
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
    ```

7. Install `xclip` to allow the editor to use the system's clipboard, i.e. allowing you to copy and paste bidirectionally.

   ```sh
   sudo apt install xclip
   ```

8. Install `luarocks`

   ```sh
   sudo apt-get install luarocks
   ```

9. Install `build-essential` and `clang`

   ```sh
   sudo apt-get install build-essential clang
   ```

10. Install `cmake`

    ```sh
    sudo snap install cmake --classic
    ```

### Installation

1. Clone the contents of this repo to `~/.config/nvim`.
   **NOTE:** If you cannot find a `.config` or `nvim` folder, create them using `mkdir` command.
2. Open the editor in your terminal using `nvim` command
   1. You should see all the different plugins, language servers, linters and formatters downloading and installing in a few seconds.
3. The formatters, `stylua` and `clang-format`, have different settings that make coding slightly inconvenient.
   **For example**, `stylua`, by default, formats `lua` files with a `4 space-tab` style, but the language-server `lua_ls` prefers a `2 space` formatting style. This causes harmless but many unnecessary style warnings that distract while coding.
   **Similarly**, `clang-format` formats `c++` files with a `2 space` style. We would like to change that style to the usual `4 space` formatting style unless you prefer it.
   1. For `lua` files:
        1. After installation, create a `.stylua.toml` file at `~/.config/nvim/.stylua.toml` and enter the following lines:

            ```sh
            indent_width = 2
            indent_type = "Spaces"
            ```

        2. We keep the `.stylua.toml` file at the root of our Nvim directory so that all the `lua` files are formatted with these style settings.
   2. For `c++` files:
      1. To change the `indent width` of `clang-format`, you would have to create a `.clang-format` file in the root directory of your "coding" folder.
      2. I kept my `.clang-format` file in my home directory. This allows me to have a "global" formatter settings.
      3. Create a `.clang-format` file in the root of your project/coding/root directory,
      4. Inside it, just enter:

            ```sh
            IndentWidth: 4
            ```

      5. you can look into different settings from the official [clang-format documentation](https://clang.llvm.org/docs/ClangFormatStyleOptions.html)
4. Set the path to your template CP file in `.../nvim/lua/plugins/+utility.lua`, then go to `line 722` or `template_file = { ... }`.
   1. Set the location to your template file for smooth operation.
   2. You can disable `evaluate_template_modifiers` if you do not want to use modifiers. For more information, visit [receive-modifiers/competitest](https://github.com/xeluxee/competitest.nvim?tab=readme-ov-file#receive-modifiers).
5. That's it! You are now ready to use `CiNvim` for competitive programming.

**NOTE:** After installation, reopen `nvim` shell to get greeted by `Alpha`. If faced with an error, try reopening `nvim`. Sometimes closing and reopening `nvim` shell doesn't work, in that case, try removing the nvim folder from `~/.local/share/nvim` and open `nvim` shell.
This will download and reinstall all the plugins.

### Additional Notes

To change the default font, go to `...nvim/lua/config/options.lua`; you can change `guifont` to whatever you like.

**Please** look into `/config/keymaps.lua` and explore `whichkey` to learn more about the keybindings.

Here is the list of all the plugins (excluding dependencies) used:

1. [Lazy.nvim](https://github.com/folke/lazy.nvim): Plugin manager
2. `+colorscheme`
**Note:** To change the colorscheme, change `lazy = true` to `false`, and the current one to `true`.

   1. [Catppuccin](https://github.com/catppuccin/nvim)
   2. [github-nvim-theme](https://github.com/projekt0n/github-nvim-theme)
   3. [Kanagawa: Wave](https://github.com/rebelot/kanagawa.nvim) -> Default colorscheme
   4. [vim-nightfly-colors](https://github.com/bluz71/vim-nightfly-colors)
   5. [Nightfox](https://github.com/EdenEast/nightfox.nvim)
   6. [Tokyonight](https://github.com/folke/tokyonight.nvim)
1. `+cpp`
   1. [clangd_extensions](https://github.com/p00f/clangd_extensions.nvim)
2. `+filetree`
   1. [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
5. `+git`
   1. [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
   2. [lazygi](https://github.com/kdheepak/lazygit.nvim)
6. `+lsp`
   1. [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
   2. [mason](https://github.com/williamboman/mason.nvim)
   3. [lsp_lines](https://git.sr.ht/~whynothugo/lsp_lines.nvim)
   4. [lspsaga](https://github.com/nvimdev/lspsaga.nvim)
   5. [conform](https://github.com/stevearc/conform.nvim)
   6. [nvim-lint](https://github.com/mfussenegger/nvim-lint)
7. `+ui`
   1. [alpha](https://github.com/goolord/alpha-nvim)
   2. [project](https://github.com/ahmedkhalf/project.nvim)
   3. [nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua)
   4. [noice](https://github.com/folke/noice.nvim)
   5. [nvim-notify](https://github.com/rcarriga/nvim-notify)
   6. [lualine](https://github.com/nvim-lualine/lualine.nvim)
   7. [barbar](https://github.com/romgrk/barbar.nvim)
   8. [hlargs](https://github.com/m-demare/hlargs.nvim)
   9. [dressing](https://github.com/stevearc/dressing.nvim)
   10. [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
8. `+utility`
    1. [popup](https://github.com/nvim-lua/popup.nvim)
    2. [plenary](https://github.com/nvim-lua/plenary.nvim)
    3. [autopairs](https://github.com/windwp/nvim-autopairs)
    4. [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
    5. [nvim-docs-view](https://github.com/amrbashir/nvim-docs-view)
    6. [neodev](https://github.com/folke/neodev.nvim)
    7. [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)
    8. [nvim-surround](https://github.com/kylechui/nvim-surround)
    9. [telescope](https://github.com/nvim-telescope/telescope.nvim)
    10. [todo-comments](https://github.com/folke/todo-comments.nvim)
    11. [toggleterm](https://github.com/akinsho/toggleterm.nvim)
    12. [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
    13. [trouble](https://github.com/folke/trouble.nvim)
    14. [which-key](https://github.com/folke/which-key.nvim)
    15. [smart-splits](https://github.com/mrjones2014/smart-splits.nvim)
    16. [code_runner](https://github.com/CRAG666/code_runner.nvim)
    17. [hop](https://github.com/hadronized/hop.nvim)
    18. [competitest](https://github.com/xeluxee/competitest.nvim)

**Note:** This code editor is heavily inspired by [RuNvim](https://github.com/Civitasv/runvim) and the Neovim tutorial [playlist](https://www.youtube.com/watch?v=ctH-a-1eUME&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ) by `chris@machine`.
