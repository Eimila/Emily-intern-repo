import Foundation

struct Course: Codable {
    let id: Int
    let title: String
    let estimatedHours: Int
    let isCompleted: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case estimatedHours = "estimated_hours"
        case isCompleted = "is_completed"
    }
}

struct StudentProgress: Codable {
    let studentName: String
    let courses: [Course]

    enum CodingKeys: String, CodingKey {
        case studentName = "student_name"
        case courses
    }
}

let jsonString = """
{
    "student_name": "Emily",
    "courses": [
        {
            "id": 1,
            "title": "Swift Basics",
            "estimated_hours": 6,
            "is_completed": true
        },
        {
            "id": 2,
            "title": "JSON Decoding",
            "estimated_hours": 3,
            "is_completed": false
        },
        {
            "id": 3,
            "title": "Error Handling",
            "estimated_hours": 4,
            "is_completed": true
        }
    ]
}
"""

let jsonData = Data(jsonString.utf8)
let decoder = JSONDecoder()

do {
    let progress = try decoder.decode(StudentProgress.self, from: jsonData)

    print("Student")
    print(progress.studentName)

    print("")
    print("Decoded courses")
    progress.courses.forEach { course in
        let status = course.isCompleted ? "completed" : "in progress"
        print("- \(course.title): \(course.estimatedHours) hours, \(status)")
    }

    let completedCourses = progress.courses.filter { course in
        course.isCompleted
    }

    print("")
    print("Completed course count: \(completedCourses.count)")
} catch {
    print("Could not decode JSON: \(error)")
}
