# Homebrew Installed and Useful Packages

This note documents that Homebrew is installed and lists five useful packages for everyday development work on macOS.

## Installation Screenshot

Screenshot evidence: [Homebrew installed](screenshots/homebrew-installed.png)

The screenshot shows:

- `brew --version` returning `Homebrew 5.1.14`
- `which brew` returning `/opt/homebrew/bin/brew`

## 5 Useful Brew Packages

1. **`git`**
   A version control tool for tracking code changes, creating branches, and collaborating through repositories.

2. **`node`**
   Installs Node.js and npm, which are useful for running JavaScript projects, frontend tools, and package scripts.

3. **`wget`**
   Downloads files from the command line and is useful for testing links, downloading assets, and scripting repeatable tasks.

4. **`ripgrep`**
   Provides the `rg` command, a fast search tool for finding text across project files.

5. **`tree`**
   Prints folder structures in a readable tree format, which is useful for documenting project layouts.

## Example Install Command

```zsh
brew install git node wget ripgrep tree
```

These packages provide a practical base for navigation, searching, downloading, JavaScript development, and Git workflows.
