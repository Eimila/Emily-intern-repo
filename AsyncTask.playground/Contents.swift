import Foundation

struct LearningResource {
    let title: String
    let minutesToLoad: UInt64
}

func loadResource(_ resource: LearningResource) async -> String {
    let delay = resource.minutesToLoad * 300_000_000
    try? await Task.sleep(nanoseconds: delay)

    return "\(resource.title) loaded"
}

func loadResourcesInOrder() async {
    let optionals = LearningResource(title: "Optionals notes", minutesToLoad: 1)
    let protocols = LearningResource(title: "Protocols notes", minutesToLoad: 2)

    print("Sequential loading started")
    print(await loadResource(optionals))
    print(await loadResource(protocols))
    print("Sequential loading finished")
}

func loadResourcesTogether() async {
    let generics = LearningResource(title: "Generics notes", minutesToLoad: 2)
    let errorHandling = LearningResource(title: "Error handling notes", minutesToLoad: 1)

    print("Concurrent loading started")

    async let genericsResult = loadResource(generics)
    async let errorHandlingResult = loadResource(errorHandling)

    let results = await [genericsResult, errorHandlingResult]

    results.forEach { result in
        print(result)
    }

    print("Concurrent loading finished")
}

await loadResourcesInOrder()

print("")

await loadResourcesTogether()
