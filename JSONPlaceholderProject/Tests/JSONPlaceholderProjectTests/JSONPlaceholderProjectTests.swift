import XCTest
@testable import JSONPlaceholderProject

final class JSONPlaceholderProjectTests: XCTestCase {
    func testPostDecoding() throws {
        let json = """
        {
            "userId": 1,
            "id": 10,
            "title": "Swift networking",
            "body": "Decode JSON into a Swift model."
        }
        """

        let post = try JSONDecoder().decode(Post.self, from: Data(json.utf8))

        XCTAssertEqual(post.userId, 1)
        XCTAssertEqual(post.id, 10)
        XCTAssertEqual(post.title, "Swift networking")
    }

    func testPostSummariesUseAuthorNames() {
        let posts = [
            Post(
                userId: 1,
                id: 1,
                title: "First post",
                body: "Body"
            ),
            Post(
                userId: 99,
                id: 2,
                title: "Unknown author post",
                body: "Body"
            ),
        ]
        let users = [
            User(id: 1, name: "Emily", email: "emily@example.com"),
        ]

        let summaries = SummaryFormatter.postSummaries(posts: posts, users: users)

        XCTAssertEqual(summaries[0], "#1 First post by Emily")
        XCTAssertEqual(summaries[1], "#2 Unknown author post by Unknown user")
    }
}
