return {
--  ╭──────────────────────────────────────────────────────────╮
--  │ themes                                                   │
--  ╰──────────────────────────────────────────────────────────╯
	{
		"folke/tokyonight.nvim", -- default configure files in config not plugins.colorscheme
		lazy = false,
		priority = 1000,
		config = function()
			-- load the colorscheme here
			-- vim.cmd([[colorscheme tokyonight]])
			require("config.colorscheme")
		end,
	},

	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("plugins.colorscheme.kanagawa")
		end,
	},

--  ╭──────────────────────────────────────────────────────────╮
--  │ basic support                                                    │
--  ╰──────────────────────────────────────────────────────────╯
	-- basic, all the lua functions I don't want to write twice.
	{ "nvim-lua/plenary.nvim" },

	-- All the npm/yarn/pnpm commands I don't want to type, needed by galaxyline
	{
		"vuki656/package-info.nvim",
		event = "BufEnter package.json",
		config = function()
			require("plugins.package-info")
		end,
	},

	-- basic, support multiple icons, need nerd-fonts installed in system
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({ default = true })
		end,
	},


--  ╭──────────────────────────────────────────────────────────╮
--  │ UI                                                       │
--  ╰──────────────────────────────────────────────────────────╯
	-- ui, a faster and fully programmable greeter for neovim
	{
		"goolord/alpha-nvim",
		lazy = false,
		config = function()
			require("plugins.alpha")
		end,
	},

  -- to improve the default vim.ui interfaces 
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		dependencies = "MunifTanjim/nui.nvim",
		config = function()
			require("plugins.dressing")
		end,
	},
	{ "nvim-lua/popup.nvim" },

	-- ui, tab
	{
		"romgrk/barbar.nvim",
		lazy = false,
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		event = "BufAdd",
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
		config = function()
			require("plugins.barbar")
		end,
	},

	-- ui, status line
	{
		"ecosse3/galaxyline.nvim",
		config = function()
			require("plugins.galaxyline")
		end,
		event = "VeryLazy",
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		config = function()
			require("plugins.indent")
		end,
	},

	-- opens the current buffer in a new full-screen floating window
	-- etc.
	{
		"folke/zen-mode.nvim",
		cmd = { "ZenMode" },
		config = function()
			require("plugins.zen")
		end,
		cond = EcoVim.plugins.zen.enabled,
	},

	-- dims inactive portions of the code you're editing.
	{
		"folke/twilight.nvim",
		config = true,
		cond = EcoVim.plugins.zen.enabled,
	},

  {
		"folke/noice.nvim",
		cond = EcoVim.plugins.experimental_noice.enabled,
		lazy = false,
		config = function()
			require("plugins.noice")
		end,
	},

  {
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
			})
		end,
		init = function()
			local banned_messages = {
				"No information available",
			}
			vim.notify = function(msg, ...)
				for _, banned in ipairs(banned_messages) do
					if msg == banned then
						return
					end
				end
				return require("notify")(msg, ...)
			end
		end,
	},



--  ╭──────────────────────────────────────────────────────────╮
--  │ General                                                  │
--  ╰──────────────────────────────────────────────────────────╯

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("plugins.autopairs")
		end,
	},

	--  css/html high-performance color highlighter for Neovim which has no external dependencies
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("plugins.colorizer")
		end,
	},

	{ "kylechui/nvim-surround", lazy = false, config = true },


	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
			vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
		end,
	},

	{
		"numToStr/Comment.nvim",
		lazy = false,
		branch = "jsx",
		config = function()
			require("plugins.comment")
		end,
	},
	{ "LudoPinelli/comment-box.nvim" },

	-- remaps . in a way that plugins can tap into it
	{ "tpope/vim-repeat", lazy = false },


	-- splitting/joining blocks of code like arrays,
	-- hashes, statements, objects, dictionaries, etc.
	{
		"Wansmer/treesj",
		lazy = true,
		cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
		keys = {
			{ "gJ", "<cmd>TSJToggle<CR>", desc = "Toggle Split/Join" },
		},
		config = function()
			require("treesj").setup({
				use_default_keymaps = false,
			})
		end,
	},

	-- in analogy with visual-block, but works mostly from normal mode.
	{
		"mg979/vim-visual-multi",
		keys = {
			"<C-n>",
			"<C-Up>",
			"<C-Down>",
			"<S-Up>",
			"<S-Down>",
			"<S-Left>",
			"<S-Right>",
		}, 
		config = function()
			vim.g.VM_leader = ";"
		end,
	},

	-- to highlight and search for todo comments
	-- like TODO, HACK, BUG in your code base.
	{
		"folke/todo-comments.nvim",
		lazy = false,
		event = "BufEnter",
		config = function()
			require("plugins.todo-comments")
		end,
	},

	--  ╭──────────────────────────────────────────────────────────╮
	--  │ Navigating (Telescope/Tree/Refactor)                     │
	--  ╰──────────────────────────────────────────────────────────╯

  {
		"folke/which-key.nvim",
		event = "VeryLazy",
		lazy = true,
		config = function()
			require("plugins.which-key")
		end,
	},

	-- A tool to replace text on project
	{ "nvim-pack/nvim-spectre" },
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		config = function()
			require("plugins.telescope")
		end,
		dependencies = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "cljoly/telescope-repo.nvim" },
		},
	},

	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		cmd = {
			"NvimTreeOpen",
			"NvimTreeClose",
			"NvimTreeFindFile",
			"NvimTreeFindFileToggle",
		},
		config = function()
			require("plugins.nvim_tree")
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufReadPre",
		config = function()
			require("plugins.treesitter")
		end,
		dependencies = {
			"HiPhish/nvim-ts-rainbow2",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"RRethy/nvim-treesitter-textsubjects",
		},
	},

--  ╭──────────────────────────────────────────────────────────╮
--  │ LSP                                                      │
--  ╰──────────────────────────────────────────────────────────╯
	-- LSP Base
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		servers = nil,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = {
			{ "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
		},
	},

	-- LSP Cmp
	{
		"hrsh7th/nvim-cmp", -- a completion engine
		event = "InsertEnter",
		config = function()
			require("plugins.cmp")
		end,
		dependencies = {
			"hrsh7th/cmp-nvim-lua", -- nvim-cmp source for neovim Lua API
			"hrsh7th/cmp-nvim-lsp", -- important! nvim-cmp source for neovim's built-in language server client
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-path", -- path completions
			"hrsh7th/cmp-cmdline", -- cmdline completions
			"hrsh7th/cmp-calc",
			"saadparwaiz1/cmp_luasnip", -- snippet completions
			-- LuaSnip is snippet engine, friendly-snippets is a bunch of snippets to use
			{ "L3MON4D3/LuaSnip", dependencies = "rafamadriz/friendly-snippets" },
			-- {
			-- 	cond = EcoVim.plugins.ai.tabnine.enabled,
			-- 	"tzachar/cmp-tabnine",
			-- 	build = "./install.sh",
			-- },
			{
				"David-Kunz/cmp-npm",
				config = function()
					require("plugins.cmp-npm")
				end,
			},
			{
				"zbirenbaum/copilot-cmp",
				cond = EcoVim.plugins.ai.copilot.enabled,
				config = function()
					require("copilot_cmp").setup()
				end,
			},
		},
	},

	--  ╭──────────────────────────────────────────────────────────╮
	--  │ LSP Addons                                               │
	--  ╰──────────────────────────────────────────────────────────╯
	-- adds vscode-like pictograms to neovim built-in lsp
	{ "onsails/lspkind-nvim" },

	-- A pretty window for previewing, navigating
	-- and editing your LSP locations in one place.
	{
		"dnlhc/glance.nvim",
		config = function()
			require("plugins.glance")
		end,
	},

	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		config = function()
			require("plugins.trouble")
		end,
	},

	{ "jose-elias-alvarez/typescript.nvim" },

	--  ╭──────────────────────────────────────────────────────────╮
	--  │ Formatters                                               │
	--  ╰──────────────────────────────────────────────────────────╯
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufNewFile",
		dependencies = { "mason.nvim" },
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			require("plugins.null-ls")
		end,
	},

	-- AI
	{
		"jcdickinson/codeium.nvim",
		cond = EcoVim.plugins.ai.codeium.enabled,
		event = "InsertEnter",
		cmd = "Codeium",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = true,
	},

	{
		"zbirenbaum/copilot.lua",
		lazy = false,
		cond = EcoVim.plugins.ai.copilot.enabled,
		event = "InsertEnter",
		config = function()
			require("plugins.copilot")
		end,
	},

	{
		"Bryley/neoai.nvim",
		cond = EcoVim.plugins.ai.chatgpt.enabled,
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		cmd = {
			"NeoAI",
			"NeoAIOpen",
			"NeoAIClose",
			"NeoAIToggle",
			"NeoAIContext",
			"NeoAIContextOpen",
			"NeoAIContextClose",
			"NeoAIInject",
			"NeoAIInjectCode",
			"NeoAIInjectContext",
			"NeoAIInjectContextCode",
		},
		keys = {
			{ "<leader>as", desc = "summarize text" },
			{ "<leader>ag", desc = "generate git message" },
		},
		config = true,
	},

	-- Git
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.git.signs")
		end,
	},
	{
		"sindrets/diffview.nvim",
		lazy = true,
		enabled = false,
		event = "BufRead",
		config = function()
			require("plugins.git.diffview")
		end,
	},
	{
		"akinsho/git-conflict.nvim",
		lazy = false,
		config = function()
			require("plugins.git.conflict")
		end,
	},
	{
		"ThePrimeagen/git-worktree.nvim",
		keys = {
			"<Leader>gwc",
			"<Leader>gww",
		},
		config = function()
			require("plugins.git.worktree")
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitCurrentFile",
			"LazyGitFilterCurrentFile",
			"LazyGitFilter",
		},
		config = function()
			vim.g.lazygit_floating_window_scaling_factor = 1
		end,
	},
}

