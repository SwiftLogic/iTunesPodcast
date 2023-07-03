//
//  EpisodesController.swift
//  iTunesPodcast
//
//  Created by Osaretin Uyigue on 7/3/23.
//

import UIKit

class EpisodesController: UIViewController {
    
    init(podcast: Podcast) {
        self.podcast = podcast
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpNavItems()
        setUpViews()
    }
    
    // MARK: - Properties
    private let podcast: Podcast
    
    
    // MARK: - Methods
    private func setUpViews() {
        
    }
    
    private func setUpNavItems() {
        navigationItem.title = podcast.trackName ?? ""
    }
}
