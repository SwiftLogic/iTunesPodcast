//
//  RSSFeed.swift
//  iTunesPodcast
//
//  Created by Osaretin Uyigue on 7/8/23.
//

import Foundation
import FeedKit

extension RSSFeed {
    
    func toEpisodes() -> [Episode] {
        let podcastImageUrl = iTunes?.iTunesImage?.attributes?.href
        var episodes = [Episode]()
        
        items?.forEach({ feedItem in
            var episode = Episode(feedItem: feedItem)
            // if the episode has no image, use the podcastImageUrl
            if episode.imageUrl == nil {
                episode.imageUrl = podcastImageUrl
            }
            episodes.append(episode)
        })
        return episodes
    }
}
