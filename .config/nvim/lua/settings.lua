-- vim.o.t_Co = "256"       -- don't enable this, it breaks everything
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

vim.cmd('colorscheme one-nvim')
vim.g.one_nvim_transparent_bg = false

vim.g.indent_blankline_char = '│'
vim.g.indent_blankline_filetype_exclude = {'help', 'terminal', 'startify'}
vim.g.indent_blackline_buftype_exclude = {'terminal'}
-- vim.g.indent_blankline_char_list = {'▏', '┆', '┊'}
-- vim.g.indent_blankline_use_treesitter = true

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend("force", options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}
map("n", "<C-x>", [[<Cmd> split term://zsh | resize 18 <CR>]], opt) -- bottom
map("n", "<C-l>", [[<Cmd>vnew term://zsh <CR>]], opt) -- over right

-- press esc to exit terminal insert mode
vim.cmd([[tnoremap <Esc> <C-\><C-n>]])

-- autocmd commands
vim.cmd([[
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePost ~/.config/X11/Xresources,~/.config/X11/Xdefaults !xrdb -merge %
autocmd TermOpen term://* startinsert
]])

-- auto neoformat
vim.cmd([[
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
]])
