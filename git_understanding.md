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