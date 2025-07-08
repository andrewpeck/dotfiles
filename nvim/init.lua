do
  local vim = vim
  local Plug = vim.fn["plug#"]
  vim.call("plug#begin")
  local function Plugins(...)
    local tbl_21_ = {}
    local i_22_ = 0
    for _, p in ipairs({...}) do
      local val_23_ = Plug(p)
      if (nil ~= val_23_) then
        i_22_ = (i_22_ + 1)
        tbl_21_[i_22_] = val_23_
      else
      end
    end
    return tbl_21_
  end
  Plugins("junegunn/seoul256.vim", "SirVer/ultisnips", "airblade/vim-gitgutter", "godlygeek/tabular", "junegunn/rainbow_parentheses.vim", "junegunn/vim-peekaboo", "justinmk/vim-gtfo", "MTDL9/vim-log-highlighting", "mbbill/undotree", "scrooloose/nerdcommenter", "thirtythreeforty/lessspace.vim", "vim-scripts/a.vim", "vim-scripts/taglist.vim", "w0rp/ale", "tmhedberg/matchit", "andymass/vim-matchup", "vim-airline/vim-airline", "vim-airline/vim-airline-themes", "vim-scripts/ConflictMotions", "vim-scripts/CountJump", "vim-scripts/ingo-library", "tpope/vim-eunuch", "tpope/vim-fugitive", "tpope/vim-repeat", "tpope/vim-surround", "tpope/vim-vinegar", "tpope/vim-abolish", "vhda/verilog_systemverilog.vim", "vim-scripts/VIP", "lervag/vimtex", "JuliaEditorSupport/julia-vim", "gabrielelana/vim-markdown", "jceb/vim-orgmode", "NLKNguyen/papercolor-theme", "chriskempson/base16-vim", "dmcgrady/vim-lucario", "dracula/vim", "guns/jellyx.vim", "zeis/vim-kolor", "lifepillar/vim-solarized8", "morhetz/gruvbox", "patstockwell/vim-monokai-tasty", "iCyMind/NeoSolarized", "liuchengxu/vim-which-key")
  local function _2_()
    return vim.fn["fzf#install"]()
  end
  Plug("junegunn/fzf", {["do"] = _2_})
  Plug("junegunn/fzf.vim")
  Plug("pbogut/fzf-mru.vim")
  vim.call("plug#end")
end
do
  vim.g.mapleader = " "
  vim.api.nvim_set_keymap("n", "<leader>", ":WhichKey '<Space>'<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<leader>tt", ":Tags<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<leader>f", ":Files", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<leader>rr", ":FZFMru<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<leader>rg", ":Rg<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<leader>b", ":Buffers<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<leader>g", ":GGrep<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<leader>gg", ":Gstatus<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<leader>gS", ":Gwrite<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<C-p>", ":GFiles<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<leader>bb", ":!~/bin/vhdl-beautify %<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<leader>fr", ":FZFMru<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<leader>b", ":Buffers<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<leader>fp", ":Files ~/.dotfiles<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<A-x>", ":Commands<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "C-o", ":Files ~/<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "C-n", ":Files ~/notes<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "Y", "y$", {noremap = true, silent = true})
end
do
  vim.cmd("colorscheme gruvbox")
  vim.g.tabstop = 2
  vim.g.shiftwidth = 2
  vim.g.softtabstop = 2
  vim.g.expandtab = 2
  vim.g.shiftround = t
  vim.g.linebreak = t
  vim.g.nolist = t
  vim.g.wrapmargin = 0
  vim.opt.formatoptions:remove("t")
  vim.g.showmatch = t
  vim.g.matchtime = 3
  vim.g.incsearch = t
  vim.g.hlsearch = t
  vim.g.ignorecase = t
  vim.g.smartcase = t
end
return true
