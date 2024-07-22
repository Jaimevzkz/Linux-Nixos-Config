return {
  "lervag/vimtex",
  lazy = false,   
  init = function()
    vim.g.vimtex_view_method = "zathura"

    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_compiler_latexmk = {
      continuous = 1,
    }
    -- Suppress the automatic opening of the log window
    vim.g.vimtex_quickfix_open_on_warning = 0
    vim.g.vimtex_quickfix_open_on_error = 0
  end,
  ft = 'tex',
}
