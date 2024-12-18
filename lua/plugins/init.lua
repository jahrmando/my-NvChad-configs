return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require("nvchad.configs.lspconfig").defaults()
  --     require "configs.lspconfig"
  --   end,
  -- },
  --
  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"lua-language-server", "stylua",
  			"html-lsp", "css-lsp" , "prettier", "ruff",
        "rubocop", "hclfmt",
  		},
  	},
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
        "html", "css", "terraform", "python",
        "ruby", "sql", "tsv", "tsx", "typescript",
        "yaml", "puppet", "markdown", "make", "json",
        "java", "javascript", "go", "elixir", "dart",
        "bash"
  		},
  	},
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require("cmp")
      local conf = require("nvchad.configs.cmp")

      local mymappings = {
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<Tab>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
      }

      conf.mapping = vim.tbl_deep_extend("force", conf.mapping, mymappings)
      return conf
    end,
  },

  {
    "github/copilot.vim",
    lazy = false,
    config = function()  -- Mapping tab is already used by NvChad
      vim.g.copilot_no_tab_map = true;
      vim.g.copilot_assume_mapped = true;
      vim.g.copilot_tab_fallback = "";
    -- The mapping is set to other key, see custom/lua/mappings
    -- or run <leader>ch to see copilot mapping section
    end
  },

}
