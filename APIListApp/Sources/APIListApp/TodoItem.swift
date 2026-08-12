import Foundation

struct TodoItem: Codable, Identifiable, Equatable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
