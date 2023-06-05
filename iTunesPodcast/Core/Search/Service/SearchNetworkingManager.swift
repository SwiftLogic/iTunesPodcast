//
//  SearchNetworkingManager.swift
//  iTunesPodcast
//
//  Created by Osaretin Uyigue on 6/4/23.
//

import Foundation

class SearchNetworkingManager {
    
    static let shared = SearchNetworkingManager()
    private init() {}
    
    func makeAPIRequest() async throws {
        guard let url = URL(string: "https://itunes.apple.com/search?term=jack+johnson&limit=25") else {
            throw SearchNetworkingError.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        let stringifiedData = String(data: data, encoding: .utf8)
        print("stringifiedData \(stringifiedData)")

    }
}

private enum SearchNetworkingError: Error {
    case invalidURL
    case invalidResponse
    case invalidSearchData
}
