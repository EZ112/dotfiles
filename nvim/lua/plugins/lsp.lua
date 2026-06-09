return {
  'neovim/nvim-lspconfig',
  config = function()
    vim.lsp.config('*', {})

    vim.lsp.config('denols', {
      root_markers = { 'deno.json', 'deno.jsonc' },
      init_options = {
        lint = true,
        suggest = {
          imports = {
            hosts = {
              ['https://deno.land'] = true,
              ['https://jsr.io'] = true,
            },
          },
        },
      },
    })

    vim.lsp.config('ts_ls', {
      root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json' },
      single_file_support = false,
    })

    vim.lsp.config('basedpyright', {
      settings = {
        basedpyright = {
          analysis = {
            autoImportCompletions = true,
            autoSearchPaths = true,
            diagnosticMode = 'openFilesOnly',
            useLibraryCodeForTypes = true,
          },
        },
      },
      on_init = function(client)
        local venv = os.getenv('UV_PROJECT_ENVIRONMENT')
        if venv then
          client.config.settings.python = { pythonPath = venv .. '/bin/python' }
          client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
        end
      end,
    })

    vim.lsp.config('ruff', {
      on_attach = function(client)
        client.server_capabilities.hoverProvider = false
      end,
    })
  end,
}
