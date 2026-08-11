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
## Writing Meaningful Commit Messages

### What makes a good commit message?

A good commit message is clear, specific, and concise. It should explain what changed and, when necessary, why the change was made. A strong commit message helps someone understand the purpose of a commit without needing to inspect every file immediately.

For example, `Add commit message practice notes` is better than `fixed stuff` because it describes the actual change. A good commit message should be easy to scan in `git log`, should describe one focused change, and should avoid unnecessary details that make the history harder to read.

### How does a clear commit message help in team collaboration?

Clear commit messages help teammates review changes, understand project history, and find important updates later. They make it easier to track bug fixes, features, and decisions across a project.

In a team, developers often need to understand work that someone else completed days, weeks, or months earlier. A clear message helps reviewers quickly understand the intent of a change before reading the code. It also helps future team members search the history, connect commits to project tasks, and understand why a change was made.

### How can poor commit messages cause issues later?

Poor commit messages such as `fixed stuff`, `update`, or `changes` make it hard to understand what changed. This can slow down debugging, code review, and future maintenance because developers may need to open each commit to figure out its purpose.

Poor messages can also make it harder to find when a bug was introduced. If the project history is full of vague messages, teammates cannot easily tell which commits relate to a feature, bug fix, or documentation update.

### What did I notice from testing different commit messages?

I tested three different commit message styles. The vague message, `fixed stuff`, was not helpful because it did not explain the change. The overly detailed message included too much unnecessary explanation, which made it hard to read in the commit history. The well-structured message, `Add commit message practice notes`, was easier to scan and understand because it clearly described the change in a short sentence.

This showed me that useful commit messages are not just about being short. They need to give enough context while still staying focused.
