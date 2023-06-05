//
//  Podcast.swift
//  iTunesPodcast
//
//  Created by Osaretin Uyigue on 6/4/23.
//

import Foundation

struct Podcast: Decodable {
    var trackName: String?
    var artistName: String?
}



struct PodcastSearchResult: Decodable {
    let resultCount: Int
    let podcasts: [Podcast]
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case podcasts = "results"
    }
}
