return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- Keymaps attached only when an LSP connects to a buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        local builtin = require("telescope.builtin")
        map("gd", builtin.lsp_definitions, "Go to Definition")
        map("gD", vim.lsp.buf.declaration, "Go to Declaration")
        map("gr", builtin.lsp_references, "Go to References")
        map("gi", builtin.lsp_implementations, "Go to Implementation")
        map("<leader>D", builtin.lsp_type_definitions, "Type Definition")
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
        map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
      end,
    })

    -- Setup Mason
    require("mason").setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    vim.keymap.set("n", "<leader>cm", "<cmd>Mason<CR>", { desc = "Mason Package Manager" })

    -- Capabilities for autocompletion
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if has_cmp then
      capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())
    end

    -- Language servers to install and setup
    local servers = {
      gopls = {},
      ts_ls = {},
      ruby_lsp = {},
      jsonls = {},
      yamlls = {},
      bashls = {},
      html = {},
      cssls = {},
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              checkThirdParty = false,
            },
          },
        },
      },
    }

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      "stylua",
      "prettier",
      "shfmt",
      "goimports",
    })
    require("mason-tool-installer").setup({
      ensure_installed = ensure_installed,
      auto_update = false,
      run_on_start = true,
      start_delay = 500,
    })

    local lspconfig = require("lspconfig")
    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_keys(servers or {}),
      automatic_installation = true,
      handlers = {
        function(server_name)
          local server_config = servers[server_name] or {}
          server_config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server_config.capabilities or {})
          lspconfig[server_name].setup(server_config)
        end,
      },
    })
  end,
}
