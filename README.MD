# ic10.nvim

A dedicated Neovim plugin for Stationeers IC10 (Integrated Circuit) language support.

## Features

-  **File Detection**: Automatically detects `*.ic10` files.
-  **Syntax Highlighting**: Simple vim-style syntax highlighting.

## Planned
-  **LSP Support**:
  - **Autocomplete**: Instructions, Registers (r0-r15, d0-d5), Labels (for branch instructions), and Logic Types/Properties.
  - **Hover**: Documentation for all instructions and in-game Logic Types (e.g., `Pressure`, `RatioOxygen`).
  - **Go to Definition**: Jump to label definitions.
  - **References**: Find usages of labels or variables.

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
return {
  "Pesterenan/ic10.nvim",
  ft = "ic10",
  config = function()
    require("ic10").setup()
  end,
}
```

## Usage

Just open any `.ic10` file. The plugin will automatically attach the LSP and setup syntax highlighting.

### Keymaps (Standard LSP)

- `K`: Hover documentation.
- `gd`: Go to definition (for labels).
- `gr`: Go to references.
- `Ctrl-n` / `Ctrl-p`: Next or Previous Autocomplete.
