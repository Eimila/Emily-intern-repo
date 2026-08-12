# Async Task Playground

Open `AsyncTask.playground` in Xcode, then run the playground.

This playground demonstrates Swift concurrency basics:

- `async`, which marks a function that can pause while waiting for work.
- `await`, which waits for an async result.
- `Task`, which starts async work from regular top-level playground code.
- `async let`, which starts multiple async operations concurrently.

The example simulates loading learning resources with short delays.
