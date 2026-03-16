-- vim.opt.background = 'light'
-- vim.cmd.colorscheme 'acme'

require('catppuccin').setup {
  flavour = 'mocha',
  transparent_background = true,
  dim_inactive = {
    enabled = false, -- dims the background color of inactive window
    shade = 'dark',
    percentage = 0.15, -- percentage of the shade to apply to the inactive window
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    treesitter = true,
    fidget = true,
  },
}
-- setup must be called before loading
vim.cmd.colorscheme 'catppuccin'
