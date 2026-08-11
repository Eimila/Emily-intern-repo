# Zshrc Aliases and Functions

This note provides a `.zshrc` snippet with five aliases and two functions for faster terminal navigation and everyday project work.

## `.zshrc` Snippet

```zsh
# List files in long format, including hidden files.
alias ll="ls -la"

# Move up one directory.
alias ..="cd .."

# Clear the terminal screen.
alias c="clear"

# Show concise Git status.
alias gs="git status --short"

# Show the current Git branch.
alias gb="git branch --show-current"

# Create a directory and move into it.
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Create a timestamped backup copy of a file.
backup() {
  cp "$1" "$1.backup-$(date +%Y%m%d-%H%M%S)"
}
```

## What Each Alias Does

1. **`ll`** runs `ls -la`, which lists files in long format and includes hidden files.
2. **`..`** runs `cd ..`, which moves up one folder level.
3. **`c`** runs `clear`, which clears the terminal screen.
4. **`gs`** runs `git status --short`, which shows a compact Git working tree status.
5. **`gb`** runs `git branch --show-current`, which prints the current branch name.

## What Each Function Does

1. **`mkcd folder-name`** creates a folder and immediately moves into it.
2. **`backup file-name`** creates a timestamped backup copy of a file in the same folder.

## How To Use It

Copy the snippet into `~/.zshrc`, then reload the shell configuration:

```zsh
source ~/.zshrc
```

After reloading, the aliases and functions can be used from any new terminal session.
