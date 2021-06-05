vim.go.t_Co = "256"
vim.o.fileencoding = "UTF-8"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.mouse = "a"
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.clipboard = "unnamedplus"
vim.o.inccommand = "nosplit"
vim.o.updatetime = 250
vim.o.termguicolors = true
vim.o.title = true
vim.wo.number = true
vim.wo.cursorline = true
vim.wo.cursorcolumn = true

-- colorscheme
vim.cmd("colorscheme one-nvim")
-- local base16 = require "base16"
-- base16(base16.themes["onedark"], true)
-- require('custom_highlights')

-- vim.g.one_nvim_transparent_bg = false

-- indent
vim.g.indent_blankline_char = "│"
-- vim.g.indent_blankline_char_list = {'▏', '┆', '┊'}
vim.g.indent_blankline_filetype_exclude = {
    "help",
    "terminal",
    "startify",
    "packer"
}
vim.g.indent_blackline_buftype_exclude = {"terminal"}

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}
map("n", "<C-x>", [[<Cmd> split term://$SHELL | resize 16 <CR>]], opt) -- bottom
map("n", "<C-l>", [[<Cmd> vnew term://$SHELL <CR>]], opt) -- over right

local cmd = vim.cmd
-- terminal settings
cmd([[
autocmd TermOpen * startinsert
autocmd TermOpen * setlocal nonumber
tnoremap <Esc> <C-\><C-n>
]])

-- autocmd commands
cmd(
    [[
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePost ~/.config/x11/Xresources,~/.config/x11/Xdefaults !xrdb -merge %
]]
)

-- auto neoformat
cmd([[
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
]])
