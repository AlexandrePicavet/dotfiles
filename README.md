# Dotfiles

## Zsh

The zsh configuration is located in the `.config/zsh` directory, this path is set via the `.zshenv` file.

There's two places where you can customize or override the default configuration:

1. **Before** the configuration loads by creating a `~/.user.zshenv` file
2. **After** the configuration loads by creating a `~/.user.zshrc` file

These user-specific files are not tracked by Git.

### Override default configuration

#### Using .user.zshenv

This file lets you modify default configuration options using environment variables.

Currently, the following variables are available:

- **IGNORED_MISSING_PACKAGES** - This is defined as an empty array in `.zshenv`, in the configuration you'll get warnings if some packages are not installed, this variable allows you to select missing packages warnings to remove.

  For example, to ignore the warning for `fzf` and `bat`:
  ```bash
    IGNORED_MISSING_PACKAGES=("fzf" "bat")
  ```

  To append `eza` later:
  ```bash
    IGNORED_MISSING_PACKAGES+=("eza")
  ```
- **SHOW_OPTIONAL_PACKAGES** - By default, optional packages are not shown in the missing packages warning.

  Set this variable to `true` to show them.

#### Using .user.zshrc

This file allows you to override or extend the default configuration after it loads.

You also have access to some *helper* functions. See the `helpers` directory for details.

