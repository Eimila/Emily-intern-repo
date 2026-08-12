import Foundation

struct StudyTask {
    let title: String
    let estimatedMinutes: Int
    let isCompleted: Bool
}

let tasks = [
    StudyTask(title: "Review Swift optionals", estimatedMinutes: 25, isCompleted: true),
    StudyTask(title: "Practise protocols", estimatedMinutes: 30, isCompleted: true),
    StudyTask(title: "Build map filter reduce playground", estimatedMinutes: 40, isCompleted: false),
    StudyTask(title: "Write reflection notes", estimatedMinutes: 20, isCompleted: false),
]

let taskTitles = tasks.map { task in
    task.title
}

let unfinishedTasks = tasks.filter { task in
    !task.isCompleted
}

let totalEstimatedMinutes = tasks.reduce(0) { runningTotal, task in
    runningTotal + task.estimatedMinutes
}

let unfinishedMinutes = unfinishedTasks.reduce(0) { runningTotal, task in
    runningTotal + task.estimatedMinutes
}

print("Map")
print(taskTitles)

print("")
print("Filter")
unfinishedTasks.forEach { task in
    print("- \(task.title)")
}

print("")
print("Reduce")
print("Total estimated minutes: \(totalEstimatedMinutes)")
print("Unfinished estimated minutes: \(unfinishedMinutes)")

print("")
print("Chaining map, filter, and reduce")
let completedTaskTitles = tasks
    .filter { task in task.isCompleted }
    .map { task in task.title }
    .reduce("Completed tasks:") { summary, title in
        "\(summary)\n- \(title)"
    }

print(completedTaskTitles)
