struct ResultBox<Value> {
    let value: Value
    let message: String

    func describe() -> String {
        return "\(message): \(value)"
    }
}

func firstItem<Item>(from items: [Item]) -> Item? {
    return items.first
}

func highestScore<Score: Comparable>(from scores: [Score]) -> Score? {
    return scores.max()
}

let nameResult = ResultBox(
    value: "Emily",
    message: "Student name loaded"
)

let scoreResult = ResultBox(
    value: 92,
    message: "Assessment score loaded"
)

let taskNames = [
    "Review optionals",
    "Practise protocols",
    "Write generic examples",
]

let assessmentScores = [78, 92, 85, 90]

print("Generic type")
print(nameResult.describe())
print(scoreResult.describe())

print("")
print("Generic function")
if let firstTask = firstItem(from: taskNames) {
    print("First task: \(firstTask)")
}

if let firstScore = firstItem(from: assessmentScores) {
    print("First score: \(firstScore)")
}

print("")
print("Generic function with Comparable constraint")
if let topScore = highestScore(from: assessmentScores) {
    print("Highest score: \(topScore)")
}
