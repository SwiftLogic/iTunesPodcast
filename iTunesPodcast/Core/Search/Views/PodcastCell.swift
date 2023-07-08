//
//  PodcastCell.swift
//  iTunesPodcast
//
//  Created by Osaretin Uyigue on 6/9/23.
//

import UIKit
import SDWebImage

class PodcastCell: UITableViewCell {
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Properties
    private let coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var podcastNameLabel = createLabel("NPR", font: UIFont.boldSystemFont(ofSize: 17), textColor: .black)
    private lazy var episodeCountLabel = createLabel("NPR", font: .systemFont(ofSize: 12), textColor: .black)
    private lazy var detailsLabel = createLabel("NPR", font: .systemFont(ofSize: 12), textColor: .black)
    
    
    
    //MARK: - Methods
    private func setUpViews() {
        addSubview(coverImageView)
        addSubview(podcastNameLabel)
        addSubview(detailsLabel)
        
        coverImageView.anchorToEdges(top: topAnchor, leading: leadingAnchor, padding: .init(top: 5, left: 20, bottom: 0, right: 0), size: .init(width: 100, height: 100))
        
        podcastNameLabel.anchorToEdges(leading: coverImageView.trailingAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 12, bottom: 0, right: 12))
        
        podcastNameLabel.centerYAnchor.constraint(equalTo: coverImageView.centerYAnchor, constant: -30).isActive = true
        
        detailsLabel.anchorToEdges(top: podcastNameLabel.bottomAnchor, leading: podcastNameLabel.leadingAnchor, trailing: podcastNameLabel.trailingAnchor)
    }
    
    
    func bindCell(to podcast: Podcast) {
        setUpImage(for: podcast.artworkUrl600)
        podcastNameLabel.text = podcast.trackName
        let episodeCount = podcast.trackCount ?? 0
        let secondaryTextAttributeText = handleSetUpAttributedText(titleString: "\(podcast.artistName ?? "")\n", subString: "\(episodeCount) Episodes", mainColor: .black, mainfont: UIFont.systemFont(ofSize: 16), secondColor: .darkGray, subFont: UIFont.systemFont(ofSize: 14))
        detailsLabel.attributedText = secondaryTextAttributeText
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

// MARK: - Helpers
