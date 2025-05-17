import Foundation

class ErrorHandler {
    static func handle(_ error: Error) -> AppError {
        switch error {
        case let appError as AppError:
            return appError
        case let urlError as URLError:
            return .networkError(urlError)
        case let decodingError as DecodingError:
            return .invalidData
        default:
            return .unknown(error)
        }
    }
    
    static func log(_ error: Error) {
        #if DEBUG
        print("Error: \(error.localizedDescription)")
        #endif
    }
} 