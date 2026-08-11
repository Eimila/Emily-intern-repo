# Git Understanding: Staging vs. Committing

## What is the difference between staging and committing?

Staging means selecting changes that I want to include in the next commit. It is done using `git add`.

Committing means saving the staged changes permanently into the Git history. It is done using `git commit`.

## Why does Git separate these two steps?

Git separates staging and committing so developers can choose exactly which changes should be included in each commit. This helps keep commits organized and focused.

For example, if I changed two files but only one change is ready, I can stage only that file and commit it separately.

## When would you want to stage changes without committing?

I would stage changes without committing when I want to review what will be included in the commit first. I might also stage changes gradually while working, or prepare a commit before writing the final commit message.

Staging gives me control over what goes into the next commit.
## Advanced Git Commands

### git checkout main -- <file>

This command restores a specific file from the main branch without changing other files.

I would use it when I accidentally changed one file and want to restore only that file, while keeping other changes in my working directory.

### git cherry-pick <commit>

This command applies one specific commit from another branch onto the current branch.

I would use it when I only need one useful fix or change from another branch, but I do not want to merge the whole branch.

### git log

This command shows the commit history of the repository.

I would use it to understand how the project changed over time, find previous commits, and check the order of changes.

### git blame <file>

This command shows who last changed each line of a file and which commit made the change.

I would use it to understand why a line was changed, find the source of a bug, or know who to ask about a part of the project.

### What surprised me?

I was surprised that cherry-pick creates a new commit on the current branch using the changes from another branch. I also learned that Git can restore only one file without changing the rest of the project.
## Debugging with git bisect

### What does git bisect do?

`git bisect` helps find the commit that introduced a bug. It uses a binary search process between a known good commit and a known bad commit. Git checks out commits in the middle, and I mark each one as good or bad until Git identifies the first bad commit.

### When would you use it in a real-world debugging situation?

I would use `git bisect` when a bug appears but I do not know which change caused it. This is useful in long-running projects with many commits, especially when manually checking every commit would take too much time.

### How does it compare to manually reviewing commits?

`git bisect` is faster than manually reviewing commits because it narrows down the problem step by step. Instead of reading every commit, I only need to test selected commits and tell Git whether each one is good or bad.

### What surprised me?

I was surprised that Git can automatically move through old commits and help locate the exact commit that introduced a problem. It feels much more efficient than guessing or checking commits one by one.