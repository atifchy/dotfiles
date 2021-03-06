-- Enable bash-language-server
require "lspconfig".bashls.setup {
    filetypes = {"sh", "zsh", "PKGBUILD"}
}

-- vim
-- require'lspconfig'.vimls.setup {}

-- rust
require "lspconfig".rust_analyzer.setup {}

-- #C
-- require "lspconfig".clangd.setup {}

-- haskell
require "lspconfig".hls.setup {
    cmd = {"haskell-language-server-wrapper", "--lsp"},
    filetypes = {
        "haskell",
        "lhaskell"
    },
    settings = {
        languageServerHaskell = {
            formattingProvider = "stylish-haskell"
        }
    }
}

-- lua
local sumneko_root_path = "/usr"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

require "lspconfig".sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = vim.split(package.path, ";")
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {"vim"}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                }
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {enable = false}
        }
    }
}
