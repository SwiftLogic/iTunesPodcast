//
//  EpisodeCell.swift
//  iTunesPodcast
//
//  Created by Osaretin Uyigue on 7/8/23.
//

import UIKit
import SDWebImage

class EpisodeCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Properties
    static let cellIdentifier = String(describing: EpisodeCell.self)

    private let coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var pubDateLabel = createLabel("pubDate", font: UIFont.boldSystemFont(ofSize: 17), textColor: .black, numOfLines: 1)
    private lazy var titleLabel = createLabel("title", font: .boldSystemFont(ofSize: 16), textColor: .black, numOfLines: 2)
    private lazy var descriptionLabel = createLabel("description", font: .systemFont(ofSize: 14), textColor: .darkGray, numOfLines: 2)
    
    
    private func setUpViews() {
        addSubview(coverImageView)
        addSubview(pubDateLabel)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        coverImageView.anchorToEdges(top: topAnchor, leading: leadingAnchor, padding: .init(top: 5, left: 20, bottom: 0, right: 0), size: .init(width: 100, height: 100))
        
        pubDateLabel.anchorToEdges(top: topAnchor, leading: coverImageView.trailingAnchor, trailing: trailingAnchor, padding: .init(top: 5, left: 12, bottom: 0, right: 12))
                
        titleLabel.anchorToEdges(top: pubDateLabel.bottomAnchor, leading: pubDateLabel.leadingAnchor, trailing: pubDateLabel.trailingAnchor, padding: .init(top: 2, left: 0, bottom: 0, right: 0))

        descriptionLabel.anchorToEdges(top: titleLabel.bottomAnchor, leading: pubDateLabel.leadingAnchor, trailing: pubDateLabel.trailingAnchor, padding: .init(top: 2, left: 0, bottom: 0, right: 0))
    }
    
    
    func bindCell(to episode: Episode) {
        setUpImage(for: episode.imageUrl)
        titleLabel.text = episode.title
        descriptionLabel.text = episode.description

        //setup date formatter for pubdate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        pubDateLabel.text = dateFormatter.string(from: episode.pubDate)
    }
    
    
    private func setUpImage(for imageUrlString: String?) {
        let placeholderImage = UIImage(named: "podcastplaceholder")
        if let urlString = imageUrlString, let url = URL(string: urlString.toSecureHTTPS()) {
            coverImageView.sd_setImage(with: url, placeholderImage: placeholderImage)
        } else {
            coverImageView.image = placeholderImage
        }
    }
}
