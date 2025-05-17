import Foundation

protocol UserRepository {
    func getUser(id: String) async throws -> User
    func updateUser(_ user: User) async throws
    func deleteUser(id: String) async throws
    func createUser(_ user: User) async throws
}

enum UserRepositoryError: Error {
    case userNotFound
    case invalidUserData
    case duplicateUser
} 