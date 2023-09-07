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
    
    var URLEncoded:String {
        let unreservedChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~"
        let unreservedCharsSet: CharacterSet = CharacterSet(charactersIn: unreservedChars)
        let encodedString = self.addingPercentEncoding(withAllowedCharacters: unreservedCharsSet)!
        return encodedString
    }
}
