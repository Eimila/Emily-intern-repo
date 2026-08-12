import Foundation

enum PostRequestError: Error {
    case invalidResponse
    case unexpectedStatusCode(Int)
}

struct NewPost: Codable {
    let title: String
    let body: String
    let userId: Int
}

func sendPostRequest(to url: URL, post: NewPost) async throws -> Any {
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.httpBody = try JSONEncoder().encode(post)

    let (data, response) = try await URLSession.shared.data(for: request)

    guard let httpResponse = response as? HTTPURLResponse else {
        throw PostRequestError.invalidResponse
    }

    guard (200...299).contains(httpResponse.statusCode) else {
        throw PostRequestError.unexpectedStatusCode(httpResponse.statusCode)
    }

    print("Status code: \(httpResponse.statusCode)")

    return try JSONSerialization.jsonObject(with: data)
}

func prettyPrintedJSON(_ json: Any) throws -> String {
    let data = try JSONSerialization.data(
        withJSONObject: json,
        options: [.prettyPrinted, .sortedKeys]
    )

    return String(data: data, encoding: .utf8) ?? ""
}

let postURL = URL(string: "https://jsonplaceholder.typicode.com/posts")!
let newPost = NewPost(
    title: "Swift POST request",
    body: "This request sends JSON from a Swift file.",
    userId: 1
)

do {
    print("Sending POST request to \(postURL.absoluteString)")

    let responseJSON = try await sendPostRequest(to: postURL, post: newPost)
    let output = try prettyPrintedJSON(responseJSON)

    print("")
    print(output)
} catch PostRequestError.invalidResponse {
    print("The server response was not valid HTTP.")
} catch PostRequestError.unexpectedStatusCode(let statusCode) {
    print("The POST request failed with status code \(statusCode).")
} catch {
    print("Could not send POST request: \(error)")
}
