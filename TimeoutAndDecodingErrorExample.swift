import Foundation

enum TimeoutError: Error {
    case timedOut
}

struct TodoItem: Codable {
    let id: Int
    let title: String
    let completed: Bool
}

func runWithTimeout<Value>(
    seconds: Double,
    operation: @escaping () async throws -> Value
) async throws -> Value {
    try await withThrowingTaskGroup(of: Value.self) { group in
        group.addTask {
            try await operation()
        }

        group.addTask {
            let nanoseconds = UInt64(seconds * 1_000_000_000)
            try await Task.sleep(nanoseconds: nanoseconds)
            throw TimeoutError.timedOut
        }

        guard let result = try await group.next() else {
            throw TimeoutError.timedOut
        }

        group.cancelAll()
        return result
    }
}

func loadSlowJSON() async throws -> Data {
    try await Task.sleep(nanoseconds: 2_000_000_000)

    let json = """
    {
        "id": 1,
        "title": "Review async timeout handling",
        "completed": false
    }
    """

    return Data(json.utf8)
}

func demonstrateTimeout() async {
    print("Timeout example")

    do {
        let data = try await runWithTimeout(seconds: 0.5) {
            try await loadSlowJSON()
        }
        print("Loaded \(data.count) bytes")
    } catch TimeoutError.timedOut {
        print("The request took too long and timed out.")
    } catch {
        print("Something went wrong: \(error)")
    }
}

func demonstrateDecodingError() {
    print("Decoding error example")

    let invalidJSON = """
    {
        "id": "one",
        "title": "Practise JSON decoding",
        "completed": false
    }
    """

    do {
        let data = Data(invalidJSON.utf8)
        let item = try JSONDecoder().decode(TodoItem.self, from: data)
        print("Decoded item: \(item.title)")
    } catch DecodingError.typeMismatch(let type, let context) {
        print("Type mismatch for \(type): \(context.debugDescription)")
    } catch DecodingError.keyNotFound(let key, let context) {
        print("Missing key '\(key.stringValue)': \(context.debugDescription)")
    } catch DecodingError.valueNotFound(let type, let context) {
        print("Missing value for \(type): \(context.debugDescription)")
    } catch DecodingError.dataCorrupted(let context) {
        print("Data corrupted: \(context.debugDescription)")
    } catch {
        print("Could not decode JSON: \(error)")
    }
}

await demonstrateTimeout()

print("")
demonstrateDecodingError()
