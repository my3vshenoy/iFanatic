import Foundation

public enum Gender {
    case male, female, undisclosed
}

// Sourcery
protocol AutoEquatable { }

public struct Person: AutoEquatable {
    public let name: String
    public let age: Int
    public let gender: Gender
    
    public init(name: String, age: Int, gender: Gender) {
        self.name = name
        self.age = age
        self.gender = gender
    }
}
