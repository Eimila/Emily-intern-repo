# Git Understanding Reflections

## Branching and Team Collaboration

### Why is pushing directly to main problematic?

Pushing directly to `main` is problematic because `main` is usually the stable version of the project. If unfinished or unreviewed work is pushed straight to `main`, it can introduce bugs, break the project for teammates, or make it harder to know which changes are ready.

Direct pushes also skip the review process. In a team, other developers should have a chance to review changes, ask questions, and suggest improvements before the work becomes part of the shared project history.

### How do branches help with reviewing code?

Branches let developers work on changes separately from `main`. This makes it easier to open a Pull Request and show reviewers exactly what changed on that branch.

Branches also keep work focused. A branch can be used for one task, bug fix, or feature, which makes the review smaller and easier to understand.

### What happens if two people edit the same file on different branches?

If two people edit the same file on different branches, Git will try to combine the changes when the branches are merged. If they changed different parts of the file, Git can often merge the changes automatically.

If they changed the same line or nearby lines, Git may create a merge conflict. Then a person needs to manually decide which version to keep or how to combine both changes.

### Evidence I used a branch

I used a branch named `branching-practice`. My commit message on that branch was `Add branching and collaboration reflection`.

I also switched back to `main` after making the branch change and observed that the changes from `branching-practice` were not visible on `main`. This showed me that branch work stays separate until it is merged.

## Debugging with git bisect

### What does git bisect do?

`git bisect` helps find the commit that introduced a bug. It uses binary search between a known good commit and a known bad commit. Git checks out commits in the middle, and I mark each one as `good` or `bad` until Git identifies the first bad commit.

### When would I use git bisect in real debugging?

I would use `git bisect` when a bug appears but I do not know which commit caused it. This is useful in real projects with many commits because checking every commit manually would take too long.

For example, if an application worked last week but is broken now, I could mark the old working commit as good and the current broken commit as bad. Then `git bisect` would help narrow down the exact commit that introduced the problem.

### How does git bisect compare to manually reviewing commits?

`git bisect` is faster and more systematic than manually reviewing commits. Manual review means looking through commits one by one and guessing which change caused the bug. `git bisect` reduces the search by testing the middle commit each time, so it can find the bad commit with fewer checks.

### My git bisect test scenario

I created a branch named `bisect-practice` and made a series of commits using `bisect_demo.txt`.

The test commits were:

- `4d064db Add bisect demo working version`
- `34fce39 Add login feature note`
- `3ccfba0 Introduce demo bug`
- `c18e952 Add profile feature note`

The bug was introduced in commit `3ccfba0 Introduce demo bug`. In that commit, the file changed to include `status=broken` and `bug=app crashes`.

### How I used the CLI

I used the terminal to run `git bisect start`, marked the latest broken version with `git bisect bad`, and marked the earlier working commit with `git bisect good 4d064db`.

Git then checked out commits for me to test. I used `cat bisect_demo.txt` to inspect whether the file showed `status=working` or `status=broken`. When the file showed the bug, I marked it as bad. When it showed the working version, I marked it as good. After the test, Git identified the first bad commit, and I used `git bisect reset` to return to the branch.

### What I learned

I learned that `git bisect` is useful because it turns debugging history into a step-by-step process. Instead of guessing which commit introduced a bug, I can test specific commits and let Git narrow the problem down.

I also learned that I need to be careful when marking commits as good or bad. If I mark a working commit as bad by mistake, Git can point to the wrong commit.

## Writing Meaningful Commit Messages

### What makes a good commit message?

A good commit message is clear, specific, and concise. It should explain what changed and, when useful, why the change was made.

For example, `Add commit message practice notes` is better than `fixed stuff` because it tells the reader what was added. A good message should be easy to scan in `git log` and should describe one focused change.

### How does a clear commit message help team collaboration?

Clear commit messages help teammates understand project history without needing to open every commit. They make reviews easier because reviewers can quickly understand the purpose of each change.

Clear messages also help later debugging. If a bug appears, meaningful commit messages make it easier to search history and find commits related to a feature, fix, or decision.

### How can poor commit messages cause problems later?

Poor commit messages such as `fixed stuff`, `update`, or `changes` make it hard to understand what actually changed. This can slow down code review, debugging, and future maintenance.

If the history is full of vague messages, teammates may need to inspect every file change to understand the purpose of a commit. This wastes time and makes collaboration harder.

### Evidence I practiced different commit messages

I made three commits with different commit message styles:

- Vague message: `fixed stuff`
- Overly detailed message: `I added another line to the commit message practice markdown file because I am trying to demonstrate what an overly detailed commit message looks like when it includes too much unnecessary explanation`
- Well-structured message: `Add commit message practice notes`

The vague message was too unclear. The overly detailed message was difficult to scan in the commit history. The well-structured message was the most useful because it was short but still explained the change.

### Open-source commit history review

I reviewed commit history from the React GitHub repository. I noticed that good commit messages were specific and action-focused, such as messages that clearly described a fix, a test update, or a documentation change.

Bad examples were messages that were too vague, such as `update` or `fix`, because they did not explain what changed. Reviewing an open-source project showed me that commit messages are important because many people rely on the history to understand how the project changed over time.
