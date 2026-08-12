import Foundation

struct UserProfile {
    let name: String?
    let email: String?
    let city: String?
}

let completeProfile = UserProfile(
    name: "Emily",
    email: "emily@example.com",
    city: "Melbourne"
)

let missingEmailProfile = UserProfile(
    name: "Kai",
    email: nil,
    city: "Sydney"
)

func welcomeMessageUsingIfLet(profile: UserProfile?) -> String {
    if let profile = profile,
       let name = profile.name,
       let email = profile.email,
       let city = profile.city {
        return "Welcome \(name)! We will contact you at \(email) in \(city)."
    }

    return "Profile is incomplete."
}

func welcomeMessageUsingGuard(profile: UserProfile?) -> String {
    guard let profile = profile else {
        return "No profile was provided."
    }

    guard let name = profile.name else {
        return "Profile is missing a name."
    }

    guard let email = profile.email else {
        return "Profile is missing an email address."
    }

    guard let city = profile.city else {
        return "Profile is missing a city."
    }

    return "Welcome \(name)! We will contact you at \(email) in \(city)."
}

print("If-let chaining")
print(welcomeMessageUsingIfLet(profile: completeProfile))
print(welcomeMessageUsingIfLet(profile: missingEmailProfile))
print(welcomeMessageUsingIfLet(profile: nil))

print("")
print("Guard let")
print(welcomeMessageUsingGuard(profile: completeProfile))
print(welcomeMessageUsingGuard(profile: missingEmailProfile))
print(welcomeMessageUsingGuard(profile: nil))
