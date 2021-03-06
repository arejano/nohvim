local astro_plugins = {
  -- Plugin manager
  ["wbthomason/packer.nvim"] = {},

  -- --Neoformat
  -- ["sbdchd/neoformat"] = {},

  --Nord Theme
  ['arcticicestudio/nord-vim']={},

  -- Optimiser
  ["lewis6991/impatient.nvim"] = {},

  -- Lua functions
  ["nvim-lua/plenary.nvim"] = { module = "plenary" },

  -- Harpoon
  ['ThePrimeagen/harpoon'] = {},

  -- Zen Mode
  ["folke/zen-mode.nvim"] = {},

  -- Svelte
  ['evanleck/vim-svelte'] = {},

  -- DB manager
  ['tpope/vim-dadbod'] = {},

  -- DB manager
  ['kristijanhusak/vim-dadbod-ui'] = {},

  -- Postman replace
  ["NTBBloodbath/rest.nvim"] = {
    config = function()
      require("rest-nvim").setup({
            -- Open request results in a horizontal split
            result_split_horizontal = false,
            -- Keep the http file buffer above|left when split horizontal|vertical
            result_split_in_place = false,
            -- Skip SSL verification, useful for unknown certificates
            skip_ssl_verification = false,
            -- Highlight request on run
            highlight = {
              enabled = true,
              timeout = 150,
            },
            result = {
              -- toggle showing URL, HTTP info, headers at top the of result window
              show_url = true,
              show_http_info = true,
              show_headers = true,
            },
            -- Jump to request line on run
            jump_to_request = false,
            env_file = '.env',
            custom_dynamic_variables = {},
            yank_dry_run = true,
          })
    end
  },

  -- EdgeMotion
  ['haya14busa/vim-edgemotion'] = {},

  -- Themer
  ['themercorp/themer.lua'] = {},

  --BarBar
  ['romgrk/barbar.nvim'] = {
    after = "nvim-web-devicons",
  },

  -- Hop
  ['phaazon/hop.nvim'] = {
  branch = 'v1', -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  end
  },

  -- Popup API
  ["nvim-lua/popup.nvim"] = {},

  -- Indent detection
  ["Darazaki/indent-o-matic"] = {
    event = "BufReadPost",
    config = function()
      require("configs.indent-o-matic").config()
    end,
  },

  -- Debugger
  ["mfussenegger/nvim-dap"] = {},
  ["nvim-telescope/telescope-dap.nvim"] = {},

  -- Notification Enhancer
  ["rcarriga/nvim-notify"] = {
    event = "VimEnter",
    config = function()
      require("configs.notify").config()
    end,
  },

  -- Neovim UI Enhancer
  ["MunifTanjim/nui.nvim"] = { module = "nui" },

  -- Cursorhold fix
  ["antoinemadec/FixCursorHold.nvim"] = {
    event = { "BufRead", "BufNewFile" },
    config = function()
      vim.g.cursorhold_updatetime = 100
    end,
  },

  -- Smarter Splits
  ["mrjones2014/smart-splits.nvim"] = {
    module = "smart-splits",
    config = function()
      require("configs.smart-splits").config()
    end,
  },

  -- Icons
  ["kyazdani42/nvim-web-devicons"] = {
    event = "VimEnter",
    config = function()
      require("configs.icons").config()
    end,
  },

  -- -- Bufferline
  -- ["akinsho/bufferline.nvim"] = {
  --   after = "nvim-web-devicons",
  --   config = function()
  --     require("configs.bufferline").config()
  --   end,
  -- },

  -- Better buffer closing
  ["famiu/bufdelete.nvim"] = { cmd = { "Bdelete", "Bwipeout" } },

  -- File explorer
  ["nvim-neo-tree/neo-tree.nvim"] = {
    branch = "v2.x",
    module = "neo-tree",
    cmd = "Neotree",
    requires = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    setup = function()
      vim.g.neo_tree_remove_legacy_commands = true
    end,
    config = function()
      require("configs.neo-tree").config()
    end,
  },

  -- Statusline
  ["feline-nvim/feline.nvim"] = {
    after = "nvim-web-devicons",
    config = function()
      require("configs.feline").config()
    end,
  },

  -- Parenthesis highlighting
  ["p00f/nvim-ts-rainbow"] = { after = "nvim-treesitter" },

  -- Autoclose tags
  ["windwp/nvim-ts-autotag"] = { after = "nvim-treesitter" },

  -- Context based commenting
  ["JoosepAlviste/nvim-ts-context-commentstring"] = { after = "nvim-treesitter" },

  -- Syntax highlighting
  ["nvim-treesitter/nvim-treesitter"] = {
    run = ":TSUpdate",
    event = { "BufRead", "BufNewFile" },
    cmd = {
      "TSInstall",
      "TSInstallInfo",
      "TSInstallSync",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSDisableAll",
      "TSEnableAll",
    },
    config = function()
      require("configs.treesitter").config()
    end,
  },

  -- Snippet collection
  ["rafamadriz/friendly-snippets"] = { event = "InsertEnter" },

  -- Snippet engine
  ["L3MON4D3/LuaSnip"] = {
    after = "friendly-snippets",
    config = function()
      require("configs.luasnip").config()
    end,
  },

  -- Completion engine
  ["hrsh7th/nvim-cmp"] = {
    after = "LuaSnip",
    config = function()
      require("configs.cmp").config()
    end,
  },

  -- Snippet completion source
  ["saadparwaiz1/cmp_luasnip"] = {
    after = "nvim-cmp",
    config = function()
      astronvim.add_user_cmp_source "luasnip"
    end,
  },

  -- Buffer completion source
  ["hrsh7th/cmp-buffer"] = {
    after = "nvim-cmp",
    config = function()
      astronvim.add_user_cmp_source "buffer"
    end,
  },

  -- Path completion source
  ["hrsh7th/cmp-path"] = {
    after = "nvim-cmp",
    config = function()
      astronvim.add_user_cmp_source "path"
    end,
  },

  -- LSP completion source
  ["hrsh7th/cmp-nvim-lsp"] = {
    after = "nvim-cmp",
    config = function()
      astronvim.add_user_cmp_source "nvim_lsp"
    end,
  },

  -- Built-in LSP
  ["neovim/nvim-lspconfig"] = { event = "VimEnter" },

  -- LSP manager
  ["williamboman/nvim-lsp-installer"] = {
    after = "nvim-lspconfig",
    config = function()
      require("configs.nvim-lsp-installer").config()
      require "configs.lsp"
    end,
  },

  -- LSP symbols
  ["stevearc/aerial.nvim"] = {
    module = "aerial",
    cmd = { "AerialToggle", "AerialOpen", "AerialInfo" },
    config = function()
      require("configs.aerial").config()
    end,
  },

  -- Formatting and linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("configs.null-ls").config()
    end,
  },

  -- Fuzzy finder
  ["nvim-telescope/telescope.nvim"] = {
    cmd = "Telescope",
    module = "telescope",
    config = function()
      require("configs.telescope").config()
    end,
  },

  -- Fuzzy finder syntax support
  ["nvim-telescope/telescope-fzf-native.nvim"] = {
    after = "telescope.nvim",
    run = vim.fn.has "win32" == 1
        and "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
      or "make",
    config = function()
      require("telescope").load_extension "fzf"
    end,
  },

  -- Git integration
  ["lewis6991/gitsigns.nvim"] = {
    event = "BufEnter",
    config = function()
      require("configs.gitsigns").config()
    end,
  },

  -- Color highlighting
  ["norcalli/nvim-colorizer.lua"] = {
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("configs.colorizer").config()
    end,
  },

  -- Autopairs
  ["windwp/nvim-autopairs"] = {
    event = "InsertEnter",
    config = function()
      require("configs.autopairs").config()
    end,
  },

  -- Terminal
  ["akinsho/nvim-toggleterm.lua"] = {
    cmd = "ToggleTerm",
    module = { "toggleterm", "toggleterm.terminal" },
    config = function()
      require("configs.toggleterm").config()
    end,
  },

  -- Commenting
  ["numToStr/Comment.nvim"] = {
    module = { "Comment", "Comment.api" },
    keys = { "gc", "gb", "g<", "g>" },
    config = function()
      require("configs.Comment").config()
    end,
  },

  -- Indentation
  ["lukas-reineke/indent-blankline.nvim"] = {
    event = "BufRead",
    config = function()
      require("configs.indent-line").config()
    end,
  },

  -- Keymaps popup
  ["folke/which-key.nvim"] = {
    module = "which-key",
    config = function()
      require("configs.which-key").config()
    end,
  },


  -- Trouble Panel
  ["folke/trouble.nvim"] = {},

  -- Smooth scrolling
  ["declancm/cinnamon.nvim"] = {
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("configs.cinnamon").config()
    end,
  },

  -- Smooth escaping
  ["max397574/better-escape.nvim"] = {
    event = "InsertCharPre",
    config = function()
      require("configs.better_escape").config()
    end,
  },

  -- Get extra JSON schemas
  ["b0o/SchemaStore.nvim"] = { module = "schemastore" },

  -- Session manager
  ["Shatur/neovim-session-manager"] = {
    module = "session_manager",
    cmd = "SessionManager",
    event = "BufWritePost",
    config = function()
      require("configs.session_manager").config()
    end,
  },

  -- Rust
  ["simrat39/rust-tools.nvim"] = {},

  --Transparent 
  ["xiyaowong/nvim-transparent"] ={}
}

local user_plugin_opts = astronvim.user_plugin_opts
local packer = astronvim.initialize_packer()
packer.startup {
  function(use)
    for key, plugin in pairs(user_plugin_opts("plugins.init", astro_plugins)) do
      if type(key) == "string" and not plugin[1] then
        plugin[1] = key
      end
      use(plugin)
    end
  end,
  config = user_plugin_opts("plugins.packer", {
    compile_path = astronvim.default_compile_path,
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
    profile = {
      enable = true,
      threshold = 0.0001,
    },
    git = {
      clone_timeout = 300,
      subcommands = {
        update = "pull --rebase",
      },
    },
    auto_clean = true,
    compile_on_sync = true,
  }),
}

-- Hop start
require'hop'.setup()

astronvim.compiled()
