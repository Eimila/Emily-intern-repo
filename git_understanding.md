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
## Branching and Team Collaboration

### Why is pushing directly to main problematic?

Pushing directly to main can be risky because main is usually the stable version of the project. If unfinished or broken code is pushed directly to main, it can affect everyone on the team.

### How do branches help with reviewing code?

Branches allow developers to work on changes separately before merging them into main. This makes it easier for teammates to review the code, suggest changes, and check that everything works before the change becomes part of the stable project.

### What happens if two people edit the same file on different branches?

If two people edit the same file on different branches, Git will try to merge the changes automatically. If they edit different parts of the file, the merge may work without problems. If they edit the same lines, Git may create a merge conflict, and the team needs to manually decide how to combine the changes.