# Emily-intern-repo

## Xcode and Swift Deliverables

This repo includes small Xcode and Swift practice deliverables:

- [Xcode Interface Exploration](Xcode-Interface-Exploration.md) summarizes each
  main Xcode panel and includes personal observations from exploring the
  interface.
- [HelloApp](HelloApp/) contains the simple Swift macOS **Hello App** project
  folder, including SwiftUI source files, package configuration, and tests.
- [Protocol Default Implementation](ProtocolDefaultImplementation.md) documents
  a Swift protocol and extension-based default implementation, with a minimal
  example in `SimpleProtocolDefaultImplementation.swift`.
- [Generic Type and Function Example](GenericTypeFunction.md) documents generic
  examples, including a TypeScript example in `src/genericExample.ts`.

## CI/CD Static Analysis Setup

This repo includes CI/CD static analysis for Markdown quality checks.

### Workflow File Path

The GitHub Actions workflow is located at:

```text
.github/workflows/static-analysis.yml
```

### What Runs On Pull Requests

The workflow runs on pull requests targeting `main`. It:

1. Checks out the repository.
2. Sets up Node.js.
3. Installs dependencies with `npm ci`.
4. Runs `npm run check:static`.

The workflow also runs on pushes to `main` and `codex/**` branches.

### Markdown Linting

Markdown linting is configured in:

```text
.markdownlint-cli2.jsonc
```

Run it locally with:

```bash
npm run lint:md
```

This uses `markdownlint-cli2` to check Markdown structure and consistency.

### Spell Checking

Spell checking is configured in:

```text
cspell.json
```

Run it locally with:

```bash
npm run spellcheck
```

This uses CSpell to check Markdown files and a project dictionary for technical terms, names, and Australian English spellings.

### Git Hook Configuration

The pre-commit hook is configured with Husky at:

```text
.husky/pre-commit
```

The hook runs:

```bash
npm run check:static
```

This means Markdown linting and spell checks run before local commits.

### Reflection File

The required CI/CD reflection answers are in:

```text
ci_cd_reflection.md
```

### Test Pull Request

Test PR link:

<https://github.com/Eimila/Emily-intern-repo/pull/84>

The GitHub Actions `Markdown lint and spell check` job passed on the test PR.
