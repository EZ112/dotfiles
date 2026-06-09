return {
  'stevearc/conform.nvim',
  config = function()
    local prettier_ft = {
      'json',
      'jsonc',
      'toml',
      'yaml',
      'css',
      'html',
      'markdown',
    }
    local js_ft = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
    }

    local formatters_by_ft = {}
    for _, ft in ipairs(prettier_ft) do
      formatters_by_ft[ft] = { 'prettierd' }
    end

    for _, ft in ipairs(js_ft) do
      formatters_by_ft[ft] = function(bufnr)
        if vim.fs.root(bufnr, { 'deno.json', 'deno.jsonc' }) then
          return { 'prettierd', 'deno_fmt' }
        else
          return { 'prettierd', 'eslint_d' }
        end
      end
    end

    formatters_by_ft['java'] = { 'google-java-format' }
    formatters_by_ft['lua'] = { 'stylua' }
    formatters_by_ft['nix'] = { 'nixfmt' }
    formatters_by_ft['xml'] = { 'xmlformat' }

    require('conform').setup({
      formatters_by_ft = formatters_by_ft,
      format_on_save = {
        timeout_ms = 2000,
        lsp_fallback = true,
      },
    })
  end,
}
