local M = {}

function M.setup(plugins_dir)
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
    require("lazy").setup(plugins_dir, {
        performance = {
            cache = { enabled = true },
            rtp = {
                disabled_plugins = {
                    "rplugin",
                    "tarPlugin",
                    "tohtml",
                    "tutor",
                    "netrwPlugin",
                    "zipPlugin",
                }
            }
        }
    })
end

return M
