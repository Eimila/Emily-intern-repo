import Foundation

public struct Post: Codable, Equatable {
    public let userId: Int
    public let id: Int
    public let title: String
    public let body: String

    public init(userId: Int, id: Int, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
}

public struct User: Codable, Equatable {
    public let id: Int
    public let name: String
    public let email: String

    public init(id: Int, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
}
