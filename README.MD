# ic10.nvim

A dedicated Neovim plugin for Stationeers IC10 (Integrated Circuit) language support.

## Features

-  **File Detection**: Automatically detects `*.ic10` files.
-  **Syntax Highlighting**: Simple vim-style syntax highlighting.
-  **LSP Support**:
-- **Hover**: Documentation for all instructions and in-game Logic Types (e.g., `Pressure`, `RatioOxygen`).
-- **Autocomplete**: Instructions, Registers (r0-r15, d0-d5), Labels (for branch instructions), and Logic Types/Properties.
-- **Go to Definition**: Jump to label definitions.
-- **Rename**: Rename aliases, defines and labels.

## Planned
-  **LSP Support**:
-- **References**: Find usages of labels or variables.
-- **Diagnostics**: Support for error validation (e.g., Max number of instructions, invalid characters...)

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
return {
  "Pesterenan/ic10.nvim",
  ft = "ic10",
  config = function()
    require("ic10").setup({
      debug = false -- Set to true to enable event logs
    })
  end,
}
```

## Usage

Just open any `.ic10` file. The plugin will automatically attach the LSP and setup syntax highlighting.

### Keymaps (Standard LSP)

- `K`: Hover documentation.
- `gd`: Go to definition (for labels).
- ~~`gr`: Go to references.~~ -- Planned
- `grn`: Rename symbol.
- `Ctrl-n` / `Ctrl-p`: Next or Previous Autocomplete.
