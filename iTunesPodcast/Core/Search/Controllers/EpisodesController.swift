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
        setUpTableView()
    }
    
    // MARK: - Properties
    private let podcast: Podcast
    static let cellId = "EpisodesCellId"
    
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Self.cellId)
    }
    
    private func setUpNavItems() {
        navigationItem.title = podcast.trackName ?? ""
    }
}


extension EpisodesController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellId, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
}
