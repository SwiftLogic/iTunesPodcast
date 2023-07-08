//
//  String.swift
//  iTunesPodcast
//
//  Created by Osaretin Uyigue on 7/8/23.
//

import Foundation

extension String {
    func toSecureHTTPS() -> String {
        return self.contains("https") ? self :
        self.replacingOccurrences(of: "http", with: "https")
    }
}
