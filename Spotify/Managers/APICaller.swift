//
//  APICaller.swift
//  Spotify
//
//  Created by Pratyush  on 9/7/21.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    private init() {}
    
    enum HTTPMethod: String {
        case GET, POST
    }
    
    enum APIError: Error {
        case failedToGetData
        case failedToUnwrapData
    }
    
    struct Constants {
        static let baseURL: String = "https://api.spotify.com/v1"
    }
    
    public func getCurrentUserProfile(completion: @escaping (Result<UserProfile, Error>) -> Void) {
        createRequest(
            with: URL(string: Constants.baseURL + "/me"),
            type: .GET
        ) { baseRequest in
            URLSession.shared.dataTask(with: baseRequest) { data, _, error in
                guard let data = data,
                      error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try? JSONDecoder().decode(UserProfile.self, from: data)
                    print(result)
                } catch {
                    print(error.localizedDescription)
                    completion(.failure(APIError.failedToUnwrapData))
                }
            }.resume()
        }
    }
    
}

private extension APICaller {
    
    func createRequest(
        with url: URL?,
        type: HTTPMethod,
        completion: @escaping (URLRequest)->Void)
    {
        AuthManager.shared.withValidToken { token in
            guard let apiUrl = url else {
                return
            }
            var request = URLRequest(url: apiUrl)
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.httpMethod = type.rawValue
            completion(request)
        }
        
    }
    
    
}
