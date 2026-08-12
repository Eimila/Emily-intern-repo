# JSONPlaceholder Project

This Swift Package demonstrates a small network project using the public
JSONPlaceholder API.

## What It Shows

- A reusable generic `NetworkManager`.
- `Codable` models for API data.
- `async/await` network calls.
- JSON decoding into Swift structs.
- Simple formatting of fetched posts and users.

The same structure can also be used with a Mocky endpoint by replacing the
`baseURL` in `main.swift`.

## Run

From the repository root:

```bash
swift run --package-path JSONPlaceholderProject JSONPlaceholderProjectApp
```

## Test

From the repository root:

```bash
swift test --package-path JSONPlaceholderProject
```
