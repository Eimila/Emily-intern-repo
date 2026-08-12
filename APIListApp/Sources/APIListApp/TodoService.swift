import Foundation

enum TodoServiceError: Error {
    case invalidResponse
    case unexpectedStatusCode(Int)
}

struct TodoService {
    private let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!

    func fetchTodos() async throws -> [TodoItem] {
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw TodoServiceError.invalidResponse
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw TodoServiceError.unexpectedStatusCode(httpResponse.statusCode)
        }

        return try JSONDecoder().decode([TodoItem].self, from: data)
    }
}
