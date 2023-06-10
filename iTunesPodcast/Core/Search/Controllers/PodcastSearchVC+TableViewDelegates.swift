//
//  PodcastSearchVC+TableViewDelegates.swift
//  iTunesPodcast
//
//  Created by Osaretin Uyigue on 6/4/23.
//

import UIKit

// MARK: - TableView Delegate & Datasource
extension PodcastSearchVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellIdentifier, for: indexPath) as! PodcastCell
        var content = cell.defaultContentConfiguration()
        let podcast = podcasts[indexPath.row]
        content.image = UIImage(named: "podcastplaceholder")
        content.imageProperties.maximumSize = .init(width: 100, height: 100)
        content.text = podcast.trackName
        content.textProperties.font = UIFont.boldSystemFont(ofSize: 17)
        let secondaryTextAttributeText = handleSetUpAttributedText(titleString: "\(podcast.artistName ?? "")\n", subString: "Episode Count", mainColor: .black, mainfont: UIFont.systemFont(ofSize: 16), secondColor: .darkGray, subFont: UIFont.systemFont(ofSize: 14))
        content.secondaryAttributedText = secondaryTextAttributeText        
////        font = UIFont.systemFont(ofSize: 16)
//        content.secondaryText = podcast.artistName
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 130
    }
}

// tertiary 14 and dark gray
public func handleSetUpAttributedText(titleString: String, subString: String, mainColor: UIColor, mainfont: UIFont, secondColor: UIColor, subFont: UIFont) -> NSMutableAttributedString {
    
    let mainAttributes = [NSAttributedString.Key.foregroundColor : mainColor, NSAttributedString.Key.font : mainfont]
    let mainAttributedText = NSMutableAttributedString(string: titleString, attributes: mainAttributes)
    
    let subAttributes = [NSAttributedString.Key.foregroundColor : secondColor, NSAttributedString.Key.font : subFont]
    
    let subAttributedText = NSMutableAttributedString(string: subString, attributes: subAttributes)
    
    mainAttributedText.append(subAttributedText)
    
    
    return mainAttributedText
}
