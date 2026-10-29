# Neovim, configured with nvf.
# Options: https://notashelf.github.io/nvf/options.html
{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.nvf.homeManagerModules.default];

  programs.nvf = {
    enable = true;

    settings.vim = {
      # --- Editor basics -----------------------------------------------------

      lineNumberMode = "relNumber";
      preventJunkFiles = true; # no swap/backup/undo files next to your code
      searchCase = "smart"; # case-insensitive unless you type a capital
      bell = "none";
      enableLuaLoader = true; # faster startup

      globals = {
        mapleader = " ";
        maplocalleader = ",";
      };

      options = {
        tabstop = 2;
        shiftwidth = 2;
        autoindent = true;
        updatetime = 250;
        splitbelow = true; # :split opens below
        splitright = true; # :vsplit opens to the right
        wrap = false;
        scrolloff = 0; # e.g. 8 to keep lines of padding around the cursor
        sidescrolloff = 0;
      };

      clipboard = {
        enable = true;
        registers = "unnamedplus"; # yank goes to the system clipboard
        providers.wl-copy.enable = true;
      };

      keymaps = [
        {
          mode = "n";
          key = "<leader>e";
          action = ":Vexplore<CR>";
          silent = true;
          desc = "Open netrw sidebar";
        }
      ];

      # --- Look --------------------------------------------------------------

      theme = {
        enable = true;
        name = "github"; # or "rose-pine"
        style = "dark_default";
        transparent = false;
      };

      statusline.lualine.enable = true;
      syntaxHighlighting = true;

      # --- Navigation & git --------------------------------------------------

      telescope = {
        enable = true;
        setupOpts.defaults = {
          border = true;
          borderchars = ["─" "│" "─" "│" "┌" "┐" "┘" "└"];
          layout_config = {
            width = 0.87;
            height = 0.85;
          };
        };
      };

      git.gitsigns.enable = true;

      # --- Completion --------------------------------------------------------

      snippets.luasnip.enable = true;

      autocomplete.nvim-cmp = {
        enable = true;
        setupOpts = {
          # Show the menu, but never insert or preselect until you press Tab.
          completion.completeopt = "menu,menuone,noinsert,noselect";
          performance.max_view_entries = 8; # cap the popup height
          window.documentation = {}; # no docs window beside the menu
        };
      };

      # --- LSP, diagnostics, formatting --------------------------------------

      lsp = {
        enable = true;
        formatOnSave = true;
        trouble.enable = true; # :Trouble diagnostics list
        lspkind.enable = true; # icons in the completion menu
        # lspSignature.enable = true; # signature popup while typing args

        # Solidity (Nomic Foundation). Runs through npx, so the first launch
        # downloads the server.
        servers.solidity_ls_nomicfoundation = {
          cmd = ["${pkgs.nodejs_22}/bin/npx" "-y" "@nomicfoundation/solidity-language-server" "--stdio"];
          filetypes = ["solidity"];
          root_markers = ["foundry.toml" ".git"];
        };
      };

      # Fix for the ~1s pause on :wq.
      # nvf formats twice on save by default: once before writing, then again
      # in the background after writing. On :wq, Neovim waits up to 1 second
      # on exit for that second run to finish. The first pass already
      # formatted the file, so turn off the second one.
      formatter.conform-nvim.setupOpts.format_after_save = null;

      diagnostics = {
        enable = true;
        config = {
          virtual_text = false;
          signs = false;
          underline = false;
          update_in_insert = false;
        };
      };

      # --- Languages (LSP + treesitter + formatter for each) -----------------

      treesitter = {
        enable = true;
        # Solidity has no languages.* module, so add its grammar directly.
        grammars = [pkgs.vimPlugins.nvim-treesitter.builtGrammars.solidity];
      };

      languages = {
        enableTreesitter = true;
        enableFormat = true;

        nix.enable = true;
        python.enable = true;
        clang.enable = true; # C and C++
        lua.enable = true;
        typescript.enable = true; # and JavaScript
        html.enable = true;
        css.enable = true;
        java.enable = true;
        markdown.enable = true;
        bash.enable = true;
      };
    };
  };
}
