//
//  SearchNetworkingManager.swift
//  iTunesPodcast
//
//  Created by Osaretin Uyigue on 6/4/23.
//

import Foundation

class SearchNetworkingManager {
    
    static let shared = SearchNetworkingManager()
    private let decoder = JSONDecoder()
    private init() {}
    
    @MainActor
    func makeAPIRequest(for searchText: String) async throws -> [Podcast] {
        var allowed = CharacterSet.alphanumerics
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchText.URLEncoded)") else {
            throw SearchNetworkingError.invalidURL
        }
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw SearchNetworkingError.invalidResponse
        }
        
        do {
            let searchResult = try decoder.decode(PodcastSearchResult.self, from: data)
            print("searchResult \(searchResult.podcasts)")
            return searchResult.podcasts
        } catch let error {
            print("decoderError: \(error.localizedDescription)")
            return []
        }
    }
}

private enum SearchNetworkingError: Error {
    case invalidURL
    case invalidResponse
    case invalidSearchData
}

extension String {
    var URLEncoded:String {
        let unreservedChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~"
        let unreservedCharsSet: CharacterSet = CharacterSet(charactersIn: unreservedChars)
        let encodedString = self.addingPercentEncoding(withAllowedCharacters: unreservedCharsSet)!
        return encodedString
    }
}
