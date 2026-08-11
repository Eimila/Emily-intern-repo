# Debug Use Cases

Debugging is the process of finding, understanding, and fixing problems in software. Different issues need different debugging approaches, so choosing the right method saves time and reduces guesswork.

## Common Debugging Use Cases

1. **Fixing syntax errors**
   Use debugging when code will not run because of missing brackets, incorrect punctuation, invalid imports, or spelling mistakes in variable names.

2. **Investigating runtime errors**
   Runtime errors happen while the program is running. Examples include `TypeError`, missing files, undefined values, or calling a function with the wrong input.

3. **Checking incorrect output**
   Sometimes code runs without crashing but produces the wrong result. Debugging helps trace values step by step to find where the logic goes wrong.

4. **Understanding unexpected user behavior**
   In frontend applications, a button may not respond, a form may not submit, or a page may show stale data. Browser DevTools can inspect events, network requests, and console errors.

5. **Finding failed test causes**
   When automated tests fail, debugging helps compare the expected result with the actual result and identify whether the bug is in the code, test data, or test expectation.

6. **Tracing data flow**
   Debugging is useful when data passes through many functions, files, or API calls. Logs and breakpoints can show where values change.

7. **Diagnosing API or network issues**
   Network debugging helps identify failed requests, incorrect URLs, missing headers, authentication problems, and unexpected response data.

8. **Checking environment problems**
   A program may work on one machine but fail on another because of missing dependencies, wrong environment variables, different Node versions, or path differences.

9. **Finding performance issues**
   Debugging can reveal slow loops, large unnecessary requests, repeated renders, memory growth, or expensive database queries.

10. **Reproducing intermittent bugs**
    Some bugs only happen sometimes. Debugging can involve adding focused logs, recording exact steps, checking timing, and testing edge cases until the issue becomes repeatable.

## Useful Debugging Methods

1. **Read the error message carefully**
   Error messages often include the file name, line number, and type of failure. Start there before changing code.

2. **Reproduce the bug**
   Write down the exact steps that cause the issue. A bug that can be reproduced is much easier to fix.

3. **Use logs**
   Add temporary `console.log()` statements to inspect values, function calls, and program flow.

4. **Use breakpoints**
   A debugger lets you pause code, step through execution, and inspect variables at a specific moment.

5. **Run focused tests**
   Run the smallest relevant test first. This gives faster feedback and avoids noise from unrelated failures.

6. **Check recent changes**
   If a bug appeared recently, review the files and commits changed around the same time.

7. **Simplify the problem**
   Remove unrelated inputs or steps until the smallest version of the bug remains.

## When To Use Each Tool

- **Terminal output:** Best for command failures, install problems, test failures, and script errors.
- **Browser DevTools Console:** Best for JavaScript errors, event handling problems, and frontend debugging.
- **Browser DevTools Network tab:** Best for API calls, slow requests, failed responses, and authentication issues.
- **Debugger breakpoints:** Best for complex logic where values change across multiple steps.
- **Automated tests:** Best for confirming a fix and preventing the same bug from returning.
- **Git history:** Best for finding when a regression was introduced.

## Debugging Mindset

Good debugging is systematic. Instead of guessing, gather evidence, test one idea at a time, and confirm the fix with a repeatable check. The goal is not just to make the error disappear, but to understand why it happened and prevent it from coming back.
