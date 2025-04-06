return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
        sync_install = false,
        ignore_install = { "javascript" },
        highlight = {
          enable = true,
          disable = { "c", "rust" },
          additional_vim_regex_highlighting = false,
        }, -- Missing comma after the highlight table
      } -- Closing brace for setup
    end -- Closing end for function
  } -- Closing brace for the plugin spec
} -- Closing brace for return
