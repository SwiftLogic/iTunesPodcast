//
//  Episode.swift
//  iTunesPodcast
//
//  Created by Osaretin Uyigue on 7/8/23.
//

import Foundation
import FeedKit

struct Episode: Decodable {
    let title: String
    let pubDate: Date
    let description: String
    var imageUrl: String?
    
    init(feedItem: RSSFeedItem) {
        self.title = feedItem.title ?? ""
        self.pubDate = feedItem.pubDate ?? Date()
        self.description = feedItem.description ?? ""
        self.imageUrl = feedItem.iTunes?.iTunesImage?.attributes?.href 
    }
}
