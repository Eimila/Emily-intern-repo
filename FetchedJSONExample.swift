import Foundation

enum JSONFetchError: Error {
    case invalidResponse
    case unexpectedStatusCode(Int)
}

func fetchJSON(from url: URL) async throws -> Any {
    let (data, response) = try await URLSession.shared.data(from: url)

    guard let httpResponse = response as? HTTPURLResponse else {
        throw JSONFetchError.invalidResponse
    }

    guard (200...299).contains(httpResponse.statusCode) else {
        throw JSONFetchError.unexpectedStatusCode(httpResponse.statusCode)
    }

    return try JSONSerialization.jsonObject(with: data)
}

func prettyPrintedJSON(_ json: Any) throws -> String {
    let data = try JSONSerialization.data(
        withJSONObject: json,
        options: [.prettyPrinted, .sortedKeys]
    )

    return String(data: data, encoding: .utf8) ?? ""
}

let jsonURL = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!

do {
    print("Fetching JSON from \(jsonURL.absoluteString)")

    let json = try await fetchJSON(from: jsonURL)
    let output = try prettyPrintedJSON(json)

    print("")
    print(output)
} catch JSONFetchError.invalidResponse {
    print("The server response was not valid HTTP.")
} catch JSONFetchError.unexpectedStatusCode(let statusCode) {
    print("The request failed with status code \(statusCode).")
} catch {
    print("Could not fetch JSON: \(error)")
}
