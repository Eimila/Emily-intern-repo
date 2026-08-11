# Static Analysis Checks in CI/CD

## Research Summary

Continuous Integration (CI) is the practice of frequently merging code into a shared repository and automatically checking that the new change still builds, tests, and follows project rules. Continuous Delivery or Deployment (CD) extends that idea by preparing or releasing software automatically after checks pass.

CI/CD is used because it gives teams fast feedback. Instead of discovering formatting problems, broken tests, or spelling mistakes after code has already been merged, automated checks catch issues during a pull request. This makes code review easier and keeps the main branch healthier.

For this repository, I configured static analysis checks for Markdown linting and spelling. The workflow runs on pull requests to `main`, and also on pushes to `main` and `codex/**` branches.

## CI Workflow

The GitHub Actions workflow is defined in `.github/workflows/static-analysis.yml`.

It performs these steps:

1. Checks out the repository.
2. Sets up Node.js.
3. Installs dependencies with `npm ci`.
4. Runs `npm run check:static`.

The static check command runs:

```bash
npm run lint:md
npm run spellcheck
```

## Git Hooks

I also configured Husky with a `pre-commit` hook:

```bash
npm run check:static
```

This means Markdown linting and spell checks run before a commit is created locally. The hook helps catch simple issues earlier than CI, while CI still acts as the shared safety net for pull requests.

## What Is The Purpose Of CI/CD?

The purpose of CI/CD is to automate the process of checking, integrating, and sometimes deploying code. CI helps verify that a change is safe to merge by running tests and static analysis every time code is pushed or a pull request is opened. CD helps move validated code toward release more consistently.

In practice, CI/CD reduces manual work and gives developers quicker feedback. It also protects the main branch because every change has to pass the same repeatable checks instead of relying only on human memory.

## How Does Automating Style Checks Improve Project Quality?

Automating style checks improves quality by making formatting, Markdown structure, and spelling consistent across the project. It removes small review distractions, so reviewers can focus more on content, correctness, and design.

Automated checks also make expectations clear. A contributor does not need to guess which Markdown style or spelling rules apply because the tools enforce those rules the same way each time.

## What Are Some Challenges With Enforcing Checks In CI/CD?

One challenge is false positives. Spell checkers can flag names, product terms, abbreviations, or technical words that are correct for the project. The fix is to maintain a project dictionary carefully instead of disabling the tool whenever it complains.

Another challenge is balancing strictness with productivity. If the rules are too loose, they do not improve quality. If they are too strict, developers may spend too much time fighting the tools. CI checks also need to be fast enough that they do not slow down pull request feedback.

## How Do CI/CD Pipelines Differ Between Small Projects And Large Teams?

Small projects usually have simpler pipelines. A small repo might only run formatting, linting, spell checks, and unit tests before merge. The configuration can stay compact because there are fewer languages, services, and deployment environments.

Large teams often need more complex pipelines. They may run multiple test suites, security scans, dependency audits, build artifacts, preview deployments, integration tests, approval gates, and staged releases. Larger teams also care more about permissions, branch protection, audit logs, and keeping expensive CI jobs efficient.

## Test PR Review

I opened a test pull request from the `codex/static-analysis-ci` branch into `main` to review the automated checks: <https://github.com/Eimila/Emily-intern-repo/pull/84>.

GitHub Actions ran the `Markdown lint and spell check` job on the PR. The automated checks passed, confirming that the workflow successfully installs dependencies and runs `npm run check:static` before the PR is merged.

## References

- GitHub Docs, ["Understanding GitHub Actions"](https://docs.github.com/en/actions/about-github-actions/understanding-github-actions)
- GitHub Docs, ["About continuous integration with GitHub Actions"](https://docs.github.com/en/actions/automating-builds-and-tests/about-continuous-integration)
- TechTarget, ["Continuous delivery (CD)"](https://www.techtarget.com/searchitoperations/definition/continuous-delivery-CD)
- Husky, ["Get started"](https://typicode.github.io/husky/get-started.html)
- CSpell, ["GitHub Action Settings"](https://cspell.org/docs/Configuration/githubaction)
