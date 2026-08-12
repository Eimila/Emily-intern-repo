import Foundation

public enum SummaryFormatter {
    public static func postSummaries(posts: [Post], users: [User]) -> [String] {
        let usersById = Dictionary(uniqueKeysWithValues: users.map { user in
            (user.id, user)
        })

        return posts.map { post in
            let author = usersById[post.userId]?.name ?? "Unknown user"
            return "#\(post.id) \(post.title) by \(author)"
        }
    }
}
