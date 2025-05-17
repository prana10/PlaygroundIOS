import Foundation

class MockUserRepository: UserRepository {
    private var users: [String: User] = [
        "1": User(id: "1", name: "Test User", email: "test@example.com")
    ]
    
    func getUser(id: String) async throws -> User {
        guard let user = users[id] else {
            throw UserRepositoryError.userNotFound
        }
        return user
    }
    
    func updateUser(_ user: User) async throws {
        guard users[user.id] != nil else {
            throw UserRepositoryError.userNotFound
        }
        users[user.id] = user
    }
    
    func deleteUser(id: String) async throws {
        guard users[id] != nil else {
            throw UserRepositoryError.userNotFound
        }
        users.removeValue(forKey: id)
    }
    
    func createUser(_ user: User) async throws {
        guard users[user.id] == nil else {
            throw UserRepositoryError.duplicateUser
        }
        users[user.id] = user
    }
} 