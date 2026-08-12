import Foundation

enum NetworkError: Error {
    case invalidResponse
    case unexpectedStatusCode(Int)
}

final class NetworkManager {
    private let session: URLSession
    private let decoder: JSONDecoder
    private let encoder: JSONEncoder

    init(
        session: URLSession = .shared,
        decoder: JSONDecoder = JSONDecoder(),
        encoder: JSONEncoder = JSONEncoder()
    ) {
        self.session = session
        self.decoder = decoder
        self.encoder = encoder
    }

    func fetch<Response: Decodable>(
        _ type: Response.Type,
        from url: URL
    ) async throws -> Response {
        let (data, response) = try await session.data(from: url)
        try validate(response)

        return try decoder.decode(Response.self, from: data)
    }

    func send<RequestBody: Encodable, Response: Decodable>(
        _ body: RequestBody,
        to url: URL,
        responseType: Response.Type
    ) async throws -> Response {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try encoder.encode(body)

        let (data, response) = try await session.data(for: request)
        try validate(response)

        return try decoder.decode(Response.self, from: data)
    }

    private func validate(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.unexpectedStatusCode(httpResponse.statusCode)
        }
    }
}

struct Todo: Codable {
    let id: Int
    let title: String
    let completed: Bool
}

struct CreatePostRequest: Codable {
    let title: String
    let body: String
    let userId: Int
}

struct PostResponse: Codable {
    let id: Int
    let title: String
    let body: String
    let userId: Int
}

let networkManager = NetworkManager()
let todoURL = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
let postsURL = URL(string: "https://jsonplaceholder.typicode.com/posts")!

do {
    print("Generic GET request")

    let todo = try await networkManager.fetch(Todo.self, from: todoURL)
    print("Todo \(todo.id): \(todo.title)")
    print("Completed: \(todo.completed)")

    print("")
    print("Generic POST request")

    let newPost = CreatePostRequest(
        title: "Generic NetworkManager",
        body: "This body is encoded from a Swift struct.",
        userId: 1
    )
    let createdPost = try await networkManager.send(
        newPost,
        to: postsURL,
        responseType: PostResponse.self
    )

    print("Created post \(createdPost.id): \(createdPost.title)")
} catch NetworkError.invalidResponse {
    print("The server response was not valid HTTP.")
} catch NetworkError.unexpectedStatusCode(let statusCode) {
    print("The request failed with status code \(statusCode).")
} catch {
    print("NetworkManager example failed: \(error)")
}
