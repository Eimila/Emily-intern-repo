protocol ReportPrintable {
    var title: String { get }
    var author: String { get }

    func printSummary()
}

extension ReportPrintable {
    func printSummary() {
        print("\(title) by \(author)")
    }
}

struct LearningNote: ReportPrintable {
    let title: String
    let author: String
}

struct ProjectReport: ReportPrintable {
    let title: String
    let author: String
    let status: String

    func printSummary() {
        print("\(title) by \(author) is currently \(status).")
    }
}

let note = LearningNote(
    title: "Protocol Default Implementation",
    author: "Emily"
)

let report = ProjectReport(
    title: "Swift Protocol Practice",
    author: "Emily",
    status: "in progress"
)

print("Default implementation from protocol extension")
note.printSummary()

print("")
print("Custom implementation")
report.printSummary()
