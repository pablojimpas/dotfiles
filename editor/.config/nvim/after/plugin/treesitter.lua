-- -- [[ Configure Treesitter ]]
-- -- See `:help nvim-treesitter`
-- -- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
-- vim.defer_fn(function()
--   require('nvim-treesitter.configs').setup {
--     -- Add languages to be installed here that you want installed for treesitter
--     ensure_installed = {
--       'c',
--       'cpp',
--       'go',
--       'lua',
--       'python',
--       'rust',
--       'tsx',
--       'javascript',
--       'typescript',
--       'vimdoc',
--       'vim',
--       'bash',
--     },
--
--     -- Autoinstall languages that are not installed.
--     auto_install = true,
--
--     highlight = {
--       enable = true,
--       disable = { "latex" },
--       additional_vim_regex_highlighting = false,
--     },
--     indent = { enable = true },
--   }
-- end, 0)
