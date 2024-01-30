//
//  AuthService.swift
//  aviator

import Foundation

class AuthService {
    
    static let shared = AuthService()
    
    var token: String?
    
    let username = "admin"
    let password = "sQBGm3LOzF5690k"
    let url = URL(string: "https://aviatorgame-backend-6ff168b0f620.herokuapp.com/login")!
    var request: URLRequest
    
    init() {
        request = URLRequest(url: url)
        request.httpMethod = "POST"
        let loginString = "\(username):\(password)"
        if let loginData = loginString.data(using: String.Encoding.utf8) {
            let base64LoginString = loginData.base64EncodedString(options: [])
            print("Login: \(base64LoginString)")
            request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        }
    }
    
    struct AuthResponse: Codable {
        let token: String?
    }

    func authenticate() async throws {
        do {
            let config = URLSessionConfiguration.default
                   config.urlCache = nil
                   config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
                   let session = URLSession(configuration: config)
            let (data, _) = try await session.data(for: request)
            let authResponse = try JSONDecoder().decode(AuthResponse.self, from: data)
            self.token = authResponse.token
        } catch {
            throw error
        }
    }
}

func main() async {
    do {
        let token = try await AuthService.shared.authenticate()
        print("Token received: \(token)")
    } catch {
        print("Error: \(error.localizedDescription)")
    }
}

func start() {
    Task {
        await main()
    }
}
