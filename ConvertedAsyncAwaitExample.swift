import Foundation

enum ProfileError: Error {
    case notFound
}

struct UserProfile {
    let id: Int
    let name: String
    let role: String
}

func fetchProfileWithCompletion(
    userID: Int,
    completion: @escaping (Result<UserProfile, Error>) -> Void
) {
    DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
        if userID == 1 {
            let profile = UserProfile(
                id: userID,
                name: "Emily",
                role: "iOS Intern"
            )
            completion(.success(profile))
        } else {
            completion(.failure(ProfileError.notFound))
        }
    }
}

func fetchProfile(userID: Int) async throws -> UserProfile {
    try await withCheckedThrowingContinuation { continuation in
        fetchProfileWithCompletion(userID: userID) { result in
            switch result {
            case .success(let profile):
                continuation.resume(returning: profile)
            case .failure(let error):
                continuation.resume(throwing: error)
            }
        }
    }
}

func printLegacyExample() {
    print("Completion handler version")

    fetchProfileWithCompletion(userID: 1) { result in
        switch result {
        case .success(let profile):
            print("Loaded \(profile.name), \(profile.role)")
        case .failure(let error):
            print("Could not load profile: \(error)")
        }
    }
}

func printAsyncAwaitExample() async {
    print("Async/await version")

    do {
        let profile = try await fetchProfile(userID: 1)
        print("Loaded \(profile.name), \(profile.role)")
    } catch {
        print("Could not load profile: \(error)")
    }
}

printLegacyExample()

try await Task.sleep(nanoseconds: 700_000_000)

print("")
await printAsyncAwaitExample()
