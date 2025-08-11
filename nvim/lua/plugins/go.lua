-- Ensure the blink.cmp module is available if you are using it for capabilities
local has_blink, blink = pcall(require, "blink.cmp")

-- Define the specific gopls settings you want
local gopls_settings = {
  gopls = {
    gofumpt = true,
    codelenses = {
      gc_details = false,
      generate = true,
      regenerate_cgo = true,
      run_govulncheck = true,
      test = true,
      tidy = true,
      upgrade_dependency = true,
      vendor = true,
    },
    -- hints = {
    --   assignVariableTypes = false,
    --   compositeLiteralFields = false,
    --   compositeLiteralTypes = false,
    --   constantValues = false,
    --   functionTypeParameters = false,
    --   parameterNames = false,
    --   rangeVariableTypes = false,
    -- },
    analyses = {
      nilness = true,
      unusedparams = true,
      unusedwrite = true,
      useany = true,
      unreachable = true,
      modernize = true,
      stylecheck = true,
      appends = true,
      asmdecl = true,
      assign = true,
      atomic = true,
      bools = true,
      buildtag = true,
      cgocall = true,
      composite = true,
      contextcheck = true,
      deact = true, -- Corrected typo from 'deba' to 'deact'
      atomicalign = true,
      composites = true,
      copylocks = true,
      deepequalerrors = true,
      defers = true,
      deprecated = true,
      directive = true,
      embed = true,
      errorsas = true,
      fillreturns = true,
      framepointer = true,
      gofix = true,
      hostport = true,
      infertypeargs = true,
      lostcancel = true,
      httpresponse = true,
      ifaceassert = true,
      loopclosure = true,
      nilfunc = true,
      nonewvars = true,
      noresultvalues = true,
      printf = true,
      shadow = true,
      shift = true,
      sigchanyzer = true,
      simplifycompositelit = true,
      simplifyrange = true,
      simplifyslice = true,
      slog = true,
      sortslice = true,
      stdmethods = true,
      stdversion = true,
      stringintconv = true,
      structtag = true,
      testinggoroutine = true,
      tests = true,
      timeformat = true,
      unmarshal = true,
      unsafeptr = true,
      unusedfunc = true,
      unusedresult = true,
      waitgroup = true,
      yield = true,
      unusedvariable = true,
    },
    usePlaceholders = false,
    completeUnimported = true,
    staticcheck = true,
    directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
    semanticTokens = false,
  },
}

-- Define the capabilities table
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- If blink is available, extend capabilities with blink's
if has_blink then
  capabilities = vim.tbl_deep_extend("force", capabilities, blink.get_lsp_capabilities())
end
-- Add file operations capabilities
capabilities = vim.tbl_deep_extend("force", capabilities, {
  fileOperations = {
    didRename = true,
    willRename = true,
  },
})

-- Return the configuration for the gopls LSP server
-- This uses LazyVim's opts pattern to override/extend the default gopls setup
return {
  -- Target the gopls LSP server configuration
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      gopls = {
        -- Use the settings defined above
        settings = gopls_settings,
        -- Use the capabilities defined above
        capabilities = capabilities,
        -- You can also add other gopls-specific options here if needed
        -- cmd = { "gopls" }, -- Usually not needed if Mason handles it
        -- filetypes = { "go", "gomod", "gowork", "gotmpl" }, -- Usually default is fine
        -- root_dir = ..., -- Usually default is fine
      },
    },
  },
}
