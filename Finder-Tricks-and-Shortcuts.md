# Finder Tricks and Shortcuts

This note collects practical Finder shortcuts and workflow tricks for navigating files faster, finding information more precisely, and keeping project folders organized on macOS.

## Keyboard Shortcuts

1. **Show or hide hidden files:** Press `Command + Shift + .` in a Finder window to toggle hidden files such as `.git`, `.env`, and `.DS_Store`.
2. **Open a new Finder window:** Press `Command + N` to start browsing from a fresh window.
3. **Open a new Finder tab:** Press `Command + T` to keep related folders in one Finder window.
4. **Close the current Finder tab or window:** Press `Command + W`.
5. **Go to a folder by path:** Press `Command + Shift + G`, then type a path such as `~/Documents` or `/tmp`.
6. **Jump to common locations:** Use `Command + Shift + H` for Home, `Command + Shift + D` for Desktop, and `Command + Shift + O` for Documents.
7. **Search in Finder:** Press `Command + F` to start a search from the current Finder context.
8. **Preview a file quickly:** Select a file and press `Space` to open Quick Look without launching the full app.
9. **Rename selected files:** Select one or more files and press `Return` to rename them.
10. **Move selected items to Trash:** Press `Command + Delete`.
11. **Duplicate an item:** Press `Command + D` to make a copy in the same folder.
12. **Copy a file path:** Right-click a file while holding `Option`, then choose **Copy as Pathname**.
13. **Open Get Info:** Press `Command + I` to view file size, location, permissions, and metadata.
14. **Change view mode:** Use `Command + 1` for icons, `Command + 2` for list, `Command + 3` for columns, and `Command + 4` for gallery.
15. **Show the path bar:** Press `Option + Command + P` to display the current folder path at the bottom of Finder.
16. **Show the status bar:** Press `Command + /` to show item counts and available disk space.
17. **Connect to a server:** Press `Command + K` to connect to network shares such as SMB drives.

## Hidden Files

Hidden files are useful when working with development projects because important configuration often starts with a dot. For example, `.gitignore`, `.prettierrc`, `.github`, and `.husky` are hidden in normal Finder browsing.

To enable hidden files:

1. Open Finder.
2. Navigate to the folder you want to inspect.
3. Press `Command + Shift + .`.
4. Press the same shortcut again when you want to hide dotfiles.

Screenshot evidence: [Finder hidden files enabled](screenshots/finder-hidden-files-enabled.png)

## Search Filters

Finder search is more powerful when filters are combined:

1. **Search within the current folder:** After pressing `Command + F`, choose the current folder name instead of **This Mac**.
2. **Filter by kind:** Use the **Kind** filter to limit results to documents, folders, images, PDFs, presentations, or code-like text files.
3. **Filter by modified date:** Add a date filter such as **Last modified date is within last 7 days** to find recent work.
4. **Filter by file extension:** Search for extensions such as `.md`, `.js`, `.png`, or `.pdf`.
5. **Use name matching:** Change a filter from **Contents** to **Name** when you only want file names that match the search text.
6. **Save repeat searches:** Click **Save** after building a useful search to create a Smart Folder.
7. **Search file contents:** Keep the search field broad when looking for words inside documents, notes, and supported text files.

## Tags

Tags help group files across folders without moving them:

1. **Add a tag:** Right-click a file, choose **Tags**, then select or type a tag name.
2. **Use color tags for status:** For example, red can mean urgent, yellow can mean in progress, and green can mean complete.
3. **Search by tag:** Click a tag in Finder's sidebar or search for `tag:tag-name`.
4. **Combine tags with search filters:** Search by tag and kind together, such as tagged project documents modified this week.
5. **Clean up old tags:** Open Finder settings and review the Tags section to rename, hide, or remove tags that are no longer useful.

## Everyday Workflow Tips

1. Use list view when comparing file dates, sizes, and names.
2. Use column view when moving through nested project folders.
3. Drag a folder into the Finder sidebar when you open it often.
4. Use Quick Look before opening large files or screenshots.
5. Keep hidden files visible while configuring development tools, then hide them again for cleaner browsing.
