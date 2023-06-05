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
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellIdentifier, for: indexPath)
        var content = cell.defaultContentConfiguration()
        let podcast = podcasts[indexPath.row]
        content.image = UIImage(named: "audioWaves")
        content.imageProperties.maximumSize = .init(width: 80, height: 80)
        content.text = podcast.trackName
        content.secondaryText = podcast.artistName
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
}
