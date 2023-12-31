local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- colorschemes
	{ "ellisonleao/gruvbox.nvim" },
	{ "catppuccin/nvim", name = "catppuccin" },
	"rebelot/kanagawa.nvim",
	"folke/tokyonight.nvim",
	"tiagovla/tokyodark.nvim",
	"savq/melange-nvim",
	"drewtempelmeyer/palenight.vim",
	"JoosepAlviste/palenightfall.nvim",
	"sainnhe/gruvbox-material",
	"navarasu/onedark.nvim",
	"NTBBloodbath/doom-one.nvim",
	"nvimdev/zephyr-nvim",
	"RRethy/nvim-base16",
	"Shatur/neovim-ayu",
	"hiszd/fleet.nvim",
	"disrupted/one.nvim",
	"haishanh/night-owl.vim",
	{ "akinsho/horizon.nvim", version = "*" },
	{ "Everblush/nvim", name = "everblush" },
	{
		"olivercederborg/poimandres.nvim",
		config = function()
			require("poimandres").setup({
				-- leave this setup function empty for default config
				-- or refer to the configuration section
				-- for configuration options
			})
		end,
	},

	-- debugger
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"mfussenegger/nvim-dap-python",

	-- session
	"rmagatti/auto-session",
	{
		"rmagatti/session-lens",
		dependencies = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
		config = function()
			require("session-lens").setup({ --[[your custom config--]]
			})
		end,
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},
	"lukas-reineke/indent-blankline.nvim",
	"hiphish/rainbow-delimiters.nvim",
	"kiyoon/treesitter-indent-object.nvim",
	"nvim-treesitter/nvim-treesitter-context",
	"windwp/nvim-ts-autotag",
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-treesitter" },
	},

	-- LSP
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"glepnir/lspsaga.nvim",
		lazy = true,
		branch = "main",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({
				symbol_in_winbar = {
					enable = false,
				},
				lightbulb = {
					enable = false,
				},
			})
		end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			--Please make sure you install markdown and markdown_inline parser
			{ "nvim-treesitter/nvim-treesitter" },
		},
		commit = "4f07545",
	},

	-- completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"dmitmel/cmp-cmdline-history",
	"hrsh7th/cmp-nvim-lsp-document-symbol",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	{ "L3MON4D3/LuaSnip" },

	-- git
	{ "sindrets/diffview.nvim", commit = "766a4f2" },
	"tpope/vim-fugitive",
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 0,
					ignore_whitespace = false,
					update_debounce = 5000,
				},
			})
		end,
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.2",
		-- or                            , branch = '0.1.x',
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{ "LinArcX/telescope-command-palette.nvim" },
	{
		"sudormrfbin/cheatsheet.nvim",

		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
	},

	-- miscellaneous
	"rmagatti/alternate-toggler",
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	"folke/trouble.nvim",
	"psf/black",
	"unblevable/quick-scope",
	"ghostbuster91/nvim-next",
	"tpope/vim-surround",
	{
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup()
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"numToStr/Navigator.nvim",
		config = function()
			require("Navigator").setup()
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup()
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"abecodes/tabout.nvim",
		dependencies = { "nvim-treesitter", "nvim-cmp" },
	},
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
		config = true,
		event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
		keys = {{
			"<leader>vs", "<cmd>:VenvSelect<cr>",
			-- key mapping for directly retrieve from cache. You may set autocmd if you prefer the no hand approach
			"<leader>vc", "<cmd>:VenvSelectCached<cr>"
		}}
	},
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
          require("neorg").setup {
            load = {
              ["core.defaults"] = {}, -- Loads default behaviour
              ["core.concealer"] = {}, -- Adds pretty icons to your documents
              ["core.dirman"] = { -- Manages Neorg workspaces
                config = {
                  workspaces = {
                    work  = "~/neorg/work",
                    perso = "~/neorg/perso",
                    notes = "~/neorg/notes",
                  },
                },
              },
            },
          }
        end,
    },
    {
        "NeogitOrg/neogit",
            dependencies = {
                "nvim-lua/plenary.nvim",         -- required
                "nvim-telescope/telescope.nvim", -- optional
                "sindrets/diffview.nvim",        -- optional
            },
        config = true
    },
    { "max397574/better-escape.nvim", event = "InsertCharPre", opts = { timeout = 300 } },
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
	    }
	},
	{
	  'glepnir/dashboard-nvim',
	  event = 'VimEnter',
	  config = function()
	    require('dashboard').setup {
	      theme = 'hyper'
	    }
	  end,
	  dependencies = { {'nvim-tree/nvim-web-devicons'}}
	}, 
}
local opts = {}
return require("lazy").setup(plugins, opts)
