import Foundation
import JSONPlaceholderProject

let baseURL = URL(string: "https://jsonplaceholder.typicode.com")!
let networkManager = NetworkManager()

do {
    let postsURL = baseURL.appending(path: "posts")
    let usersURL = baseURL.appending(path: "users")

    async let posts = networkManager.fetch([Post].self, from: postsURL)
    async let users = networkManager.fetch([User].self, from: usersURL)

    let summaries = try await SummaryFormatter.postSummaries(
        posts: Array(posts.prefix(5)),
        users: users
    )

    print("JSONPlaceholder Project")
    print("Fetched \(summaries.count) post summaries")
    print("")

    summaries.forEach { summary in
        print("- \(summary)")
    }
} catch NetworkError.invalidResponse {
    print("The server response was not valid HTTP.")
} catch NetworkError.unexpectedStatusCode(let statusCode) {
    print("The request failed with status code \(statusCode).")
} catch {
    print("Could not load JSONPlaceholder data: \(error)")
}
