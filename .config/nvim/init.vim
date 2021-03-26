
" ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗
" ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║
" ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║
" ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║
" ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║
" ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝

"======================> VIM-PLUG <=======================

call plug#begin('$HOME/.cache/nvim/plugged') 	"required

" Plugins
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'
"Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'airblade/vim-gitgutter'
Plug 'AtifChy/onedark.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
"Plug 'anott03/nvim-lspinstall'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'windwp/nvim-autopairs'

call plug#end()						" required

" Brief help
" :PlugInstall    - installs plugins; append `!` to update or just :PlugUpdate
" :PlugClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" :PlugUpgrade    - Upgrade vim-plug itself
" :PlugStatus     - Check the status of plugins
" :PlugDiff       - Examine changes from the previous update and the pending changes
" :PlugSnapshot   - Generate script for restoring the current snapshot of the plugins

"======================> VIM-PLUG <=======================

" nvim lsp
luafile ~/.config/nvim/plugin/compe-config.lua
luafile ~/.config/nvim/servers.lua
luafile ~/.config/nvim/plugin/nvim-autopair.lua
luafile ~/.config/nvim/plugin/nvim-tree.lua
source ~/.config/nvim/lsp-config.vim

" General Settings
set t_Co=256					" color support
set encoding=UTF-8				" uses UTF-8 as the default encoding
set splitbelow splitright			" fix vim window split
set mouse=a					" enable mouse
set number					" always show line number
"set number relativenumber 			" show number relativenumber
set showmatch					" set show matching parenthesis
set ignorecase					" ignore case when searching
set smartcase					" ignore case if search pattern is all lowercase, case-sensitive otherwise
set cursorline					" highlight cursor line
"set cursorcolumn 				" highlight cursor column
set clipboard+=unnamedplus			" copy paste between vim and everything else
set inccommand=nosplit				" required for hlsearch
set updatetime=250
filetype plugin indent on
"set expandtab
"set shiftwidth=4
"set tabstop=4

" colorizer
lua require'colorizer'.setup()

"autocmd InsertEnter * norm zz 				" vertically center document in insert mode
autocmd BufWritePre * %s/\s\+$//e			" remove trailing whitespace on save
autocmd BufWritePost ~/.config/X11/Xresources,~/.config/X11/Xdefaults !xrdb -merge %
							" run xrdb on ~/.Xresources & ~/.Xdefaults when I edit them
autocmd BufWrite *.hs %!stylish-haskell

" onedark settings
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
" `bg` will not be styled since there is no `bg` setting
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white })
  augroup END
endif

hi Comment cterm=italic
let g:onedark_hide_endofbuffer = 1
let g:onedark_terminal_italics = 0
let g:onedark_termcolors = 256

colorscheme onedark

" checks if your terminal has 24-bit color support
"set termguicolors
hi LineNr ctermbg=NONE guibg=NONE

" Air-line configuration
let g:airline_powerline_fonts = 1
let g:airline_highlighting_cache = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline_extensions = ['branch', 'tabline', 'coc']

" indent plugin settings
let g:indentLine_char_list = ['|']

" Key Bindings
nnoremap <Space> <Nop>
let mapleader = " "
"map <C-e> :NvimTreeToggle<CR>
"map <C-e> :CocCommand explorer<CR>
map <M-s> :setlocal spell! spelllang=en_US<CR>
"map <C-e> :NERDTree<CR>
map <C-s> :source /home/atif/.config/nvim/init.vim<CR>
"nmap <C-e> :Lex<bar>vertical resize 30<CR>

" markdown preview toggle
map <C-m> <Plug>MarkdownPreviewToggle

" neovim terminal config
map <leader>t :sp term://zsh<bar>resize 18<CR>
tnoremap <Esc> <C-\><C-n>
if has('nvim')
    autocmd TermOpen term://* startinsert
endif

" coc plugin/s
"let g:coc_global_extensions = [
"	\ 'coc-clangd',
"	\ 'coc-pairs',
"	\ 'coc-tsserver',
"	\ 'coc-json',
"	\ 'coc-rls',
"	\ 'coc-html',
"	\ 'coc-prettier',
"	\ 'coc-sh',
"	\ 'coc-highlight',
"    	\ 'coc-vimlsp'
"	\ ]
"
" coc-prettier config
"command! -nargs=0 Prettier :CocCommand prettier.formatFile
"vmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"
" source plugin config
"source /home/atif/.config/nvim/coc.vim

" startify config
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

let g:startify_custom_header = [
	\'   ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗ ',
	\'   ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║ ',
	\'   ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║ ',
	\'   ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║ ',
	\'   ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║ ',
	\'   ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝ ',
	\]
let g:startify_lists = [
	\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
	\ { 'type': 'files',     'header': ['   MRU']            },
    	\ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
	\ { 'type': 'sessions',  'header': ['   Sessions']       },
    	\ { 'type': 'commands',  'header': ['   Commands']       },
    	\ ]
let g:startify_bookmarks = [
	\ { 'a': '~/.config/nvim/init.vim' } ,
	\ { 's': '~/.config/zsh/.zshrc' },
	\ { 'd': '~/.config/alacritty/alacritty.yml' },
	\ { 'f': '~/.config/X11/Xresources' },
	\ { 'g': '~/.config/fish/config.fish' },
	\ ]
