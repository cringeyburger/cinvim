return {
  {
    "iamcco/markdown-preview.nvim",
    dependencies = {},
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = { "markdown" },
    config = function()
      vim.cmd([[
      let g:mkdp_auto_start=0
      let g:mkdp_auto_close=0
      let g:mkdp_refresh_slow=0
      let g:mkdp_markdown_css = expand("~/.config/nvim/markdown/github-markdown.css")
      " let g:mkdp_browser = 'Safari'
    ]])
    end,
  },
}
