//
//  PodcastCell.swift
//  iTunesPodcast
//
//  Created by Osaretin Uyigue on 6/9/23.
//

import UIKit

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
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private lazy var trackNameLabel = createLabel("NPR", font: .systemFont(ofSize: 12), textColor: .black)
    private lazy var episodeCountLabel = createLabel("NPR", font: .systemFont(ofSize: 12), textColor: .black)
    private lazy var artistNameLabel = createLabel("NPR", font: .systemFont(ofSize: 12), textColor: .black)
    
    
    
    //MARK: - Methods
    private func setUpViews() {
        addSubview(coverImageView)
//        addSubview(trackNameLabel)
//        addSubview(episodeCountLabel)
//        addSubview(artistNameLabel)
        
        NSLayoutConstraint.activate([
            coverImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            coverImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
        
        ])
    }

    
    private func createLabel(_ title: String, font: UIFont, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = font
        label.textColor = textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
