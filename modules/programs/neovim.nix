{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
    	#File navigation
	nvim-tree-lua
	#LSP
	nvim-lspconfig

	#Completion
	nvim-cmp
	cmp-nvim-lsp
	luasnip
    ];
  };
  xdg.configFile."nvim/init.lua".text = 
''
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.shiftwidth = 2

require("config")
'';

  xdg.configFile."nvim/lua/config.lua".text = 
''
-- File tree
require("nvim-tree").setup({
  view = { width = 30 },
})
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>s", function()
    if vim.bo.filetype == "NvimTree" then
        vim.cmd("wincmd p")
    else
        require("nvim-tree.api").tree.focus()
    end
end, {
    desc = "Toggle focus tree/file",
})

-- LSP (Neovim 0.11+)
vim.lsp.config("pyright", {})
vim.lsp.config("rust_analyzer", {})
vim.lsp.config("nil_ls", {
    settings = {
        ["nil"] = {
            formatting = {
                command = { "nixfmt" },
            },
            nix = {
                flake = {
                    autoArchive = true,
                },
            },
        },
    },
})

vim.lsp.enable({
    "pyright",
    "rust_analyzer",
    "nil_ls",
})

-- Completion
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
    require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
  },
})

vim.api.nvim_set_hl(0, "Normal", { bg = "none" });
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"});
'';
}
