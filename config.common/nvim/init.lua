-- 1. lazy.nvim のブートストラップ（自動インストール）
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

-- 2. プラグインのセットアップ
require("lazy").setup({
  "hashivim/vim-terraform", -- Plugin 'hashivim/vim-terraform' の代わり
  "cespare/vim-toml",        -- Plugin 'cespare/vim-toml' の代わり
  "fatih/vim-go",
  "ziglang/zig.vim",
})

-- 3. あなたの設定 (Vimscript から Lua へ書き換え)

-- 行・列の強調表示
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.number = true

-- インデント設定
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- 表示・タイトル
vim.opt.title = true
vim.opt.ambiwidth = "double"

-- ファイル・バックアップ関連
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = false
vim.opt.viminfofile = "NONE"

-- バックスペースの挙動
vim.opt.backspace = { "indent", "eol", "start" }

-- プラグイン固有の設定 (g:terraform_fmt_on_save)
vim.g.terraform_fmt_on_save = 1

-- シンタックスハイライト（NeovimではデフォルトでONですが念のため）
vim.cmd("syntax on")
