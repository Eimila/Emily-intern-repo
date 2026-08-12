import SwiftUI

struct TodoListView: View {
    @StateObject private var viewModel = TodoListViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            header

            Divider()

            content
        }
        .frame(minWidth: 520, minHeight: 560)
        .task {
            await viewModel.loadTodos()
        }
    }

    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("API Items")
                    .font(.title)
                    .fontWeight(.semibold)

                Text("\(viewModel.todos.count) todos, \(viewModel.completedCount) completed")
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Button {
                Task {
                    await viewModel.loadTodos()
                }
            } label: {
                Label("Refresh", systemImage: "arrow.clockwise")
            }
            .disabled(viewModel.isLoading)
        }
        .padding()
    }

    @ViewBuilder
    private var content: some View {
        if viewModel.isLoading && viewModel.todos.isEmpty {
            ProgressView("Loading API items...")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else if let errorMessage = viewModel.errorMessage {
            VStack(spacing: 12) {
                Image(systemName: "exclamationmark.triangle")
                    .font(.largeTitle)
                    .foregroundStyle(.orange)

                Text(errorMessage)
                    .multilineTextAlignment(.center)

                Button {
                    Task {
                        await viewModel.loadTodos()
                    }
                } label: {
                    Label("Try Again", systemImage: "arrow.clockwise")
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else if viewModel.todos.isEmpty {
            VStack(spacing: 12) {
                Image(systemName: "tray")
                    .font(.largeTitle)
                    .foregroundStyle(.secondary)

                Text("No API Items")
                    .font(.headline)

                Text("The API returned an empty list.")
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            List(viewModel.todos.prefix(25)) { todo in
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle")
                        .foregroundStyle(todo.completed ? .green : .secondary)
                        .font(.title3)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(todo.title.capitalized)
                            .font(.headline)

                        Text("Item \(todo.id) | User \(todo.userId)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
                .padding(.vertical, 4)
            }
        }
    }
}

#Preview {
    TodoListView()
}
