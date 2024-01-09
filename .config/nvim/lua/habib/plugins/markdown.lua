return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.cmd("let g:mkdp_auto_start = 0")
      vim.cmd("let g:mkdp_refresh_slow = 0")
    end,
    ft = { "markdown" },
  },

  {
    "preservim/vim-markdown",
    dependencies = "godlygeek/tabular",

    config = function()
      vim.cmd("let g:vim_markdown_folding_disabled = 1")
      vim.cmd("let g:vim_markdown_folding_style_pythonic = 1")
    end,
  },
}
