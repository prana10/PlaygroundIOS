import Foundation

enum AppError: LocalizedError {
    case networkError(Error)
    case dataNotFound
    case invalidData
    case unauthorized
    case serverError(String)
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        case .dataNotFound:
            return "Data not found"
        case .invalidData:
            return "Invalid data format"
        case .unauthorized:
            return "Unauthorized access"
        case .serverError(let message):
            return "Server error: \(message)"
        case .unknown(let error):
            return "Unknown error: \(error.localizedDescription)"
        }
    }
} 