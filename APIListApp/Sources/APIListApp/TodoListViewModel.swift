import Foundation

@MainActor
final class TodoListViewModel: ObservableObject {
    @Published private(set) var todos: [TodoItem] = []
    @Published private(set) var isLoading = false
    @Published var errorMessage: String?

    private let service = TodoService()

    var completedCount: Int {
        todos.filter { todo in
            todo.completed
        }.count
    }

    func loadTodos() async {
        isLoading = true
        errorMessage = nil

        do {
            todos = try await service.fetchTodos()
        } catch TodoServiceError.invalidResponse {
            errorMessage = "The server response was not valid HTTP."
        } catch TodoServiceError.unexpectedStatusCode(let statusCode) {
            errorMessage = "The request failed with status code \(statusCode)."
        } catch {
            errorMessage = "Could not load API items: \(error.localizedDescription)"
        }

        isLoading = false
    }
}
