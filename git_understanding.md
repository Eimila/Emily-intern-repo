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

Pushing directly to `main` is problematic because `main` is usually treated as the stable version of the project. If unfinished or unreviewed work is pushed straight to `main`, it can introduce bugs, break the project for other teammates, or make it harder to understand which changes are ready.

Direct pushes also skip the review process. In a team, this means other people do not get a chance to check the change, ask questions, or suggest improvements before it becomes part of the shared project history.

### How do branches help with reviewing code?

Branches let developers work on changes separately from `main`. This makes it easier to open a Pull Request, show only the changes from that branch, and ask teammates to review them before merging.

Branches also keep work organized. A branch can focus on one task or issue, which helps reviewers understand the purpose of the change and makes feedback easier to give.

### What happens if two people edit the same file on different branches?

If two people edit the same file on different branches, Git will try to combine the changes when the branches are merged. If they edit different parts of the file, Git can often merge the work automatically.

If they edit the same line or nearby lines, Git may create a merge conflict. When that happens, a person needs to manually choose which change to keep or combine both changes into a final version.

### Evidence of branch practice

I used a branch named `branching-practice` for this task. I committed the branch work with the message `Add branching and collaboration reflection`.

I also switched back to `main` after making the branch change and observed that the branch changes were not visible on `main`. This showed me that branch changes stay separate until they are merged.

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

## Merge Conflicts and Conflict Resolution

### What caused the conflict?

The conflict happened because I edited the same line in `conflict_demo.md` on two different branches. On the practice branch, I changed the decision line to use the branch version. On `main`, I changed the same line to use the main version. When I tried to merge the branch back into `main`, Git could not automatically decide which version to keep.

### How did I resolve it?

I opened the conflicted file and looked at the conflict markers. The `HEAD` section showed the version from `main`, and the other section showed the version from the practice branch. I manually edited the file to combine the ideas into one final version, removed the conflict markers, saved the file, staged it, and committed the merge.

### What did I learn?

I learned that merge conflicts happen when Git cannot safely combine changes automatically. They are not errors in Git, but situations where a human needs to decide the correct final content. I also learned that keeping branches up to date and making smaller focused changes can reduce the chance of difficult conflicts.
