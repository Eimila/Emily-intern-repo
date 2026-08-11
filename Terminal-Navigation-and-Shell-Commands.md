# Terminal Navigation and Shell Commands

This note documents a basic Terminal practice session for navigating folders, inspecting files, and creating a small folder structure from the shell.

## Terminal-Created Folder Structure

The following structure was created from the Terminal with `mkdir -p`:

```text
terminal_practice/
├── archive/
│   └── old-notes/
├── notes/
├── projects/
│   └── demo-app/
└── scripts/
```

The command used was:

```bash
mkdir -p terminal_practice/projects/demo-app terminal_practice/notes terminal_practice/archive/old-notes terminal_practice/scripts
```

## 10 Commands Explained

1. **`pwd`**
   Prints the current working directory. This helps confirm exactly where you are before creating, moving, or editing files.

2. **`ls`**
   Lists files and folders in the current directory. It is useful for checking what is available before opening or changing folders.

3. **`ls -la`**
   Lists files in long format, including hidden files that start with a dot. This is useful in project folders because configuration files such as `.gitignore` are hidden by default.

4. **`cd folder-name`**
   Changes into another folder. For example, `cd terminal_practice` moves from the repository root into the practice folder.

5. **`cd ..`**
   Moves up one folder level. This is helpful when navigating back from a nested folder to its parent directory.

6. **`mkdir folder-name`**
   Creates a new folder. For example, `mkdir notes` creates a folder named `notes` in the current location.

7. **`mkdir -p path/to/folder`**
   Creates nested folders in one command. The `-p` option prevents errors if part of the path already exists.

8. **`touch file-name`**
   Creates an empty file or updates an existing file's modified time. It is often used to quickly create placeholder files.

9. **`cp source destination`**
   Copies a file or folder. For example, `cp notes/today.md archive/today.md` copies a note into an archive location.

10. **`mv source destination`**
    Moves or renames a file or folder. For example, `mv draft.md final.md` renames a file, while `mv final.md notes/` moves it into the `notes` folder.

## Practice Reflection

These commands cover the core actions needed for everyday shell navigation: checking location, listing contents, changing directories, creating folders, and moving or copying files. The folder structure above gives a simple place to practice those actions without affecting other project files.
