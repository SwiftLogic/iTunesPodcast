//
//  EpisodesController.swift
//  iTunesPodcast
//
//  Created by Osaretin Uyigue on 7/3/23.
//

import UIKit
import FeedKit

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
        setUpTableView()
        fetchEpisodes()
    }
    
    // MARK: - Properties
    private let podcast: Podcast
    private var episodes = [Episode]()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    
    // MARK: - Methods
    private func setUpViews() {}
    
    private func setUpTableView() {
        view.addSubview(tableView)
        tableView.fillSuperview()
        tableView.register(EpisodeCell.self, forCellReuseIdentifier: EpisodeCell.cellIdentifier)
    }
    
    private func setUpNavItems() {
        navigationItem.title = podcast.trackName ?? ""
    }
    
    
    private func fetchEpisodes() {
        
        guard let feedUrlString = podcast.feedUrl, let url = URL(string: feedUrlString.toSecureHTTPS()) else {return}
        
        let parser = FeedParser(URL: url)
        parser.parseAsync {[weak self] result in
            switch result {
            case .success(let success):
                
                self?.episodes = success.rssFeed?.toEpisodes() ?? []
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            case .failure(let failure):
                print("failed to parse XML \(failure.localizedDescription)")
            }
        }
    }
    
}

extension EpisodesController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeCell.cellIdentifier, for: indexPath) as! EpisodeCell
        cell.bindCell(to: episodes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
}
