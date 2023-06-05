//
//  PodcastSearchVC.swift
//  iTunesPodcast
//
//  Created by Osaretin Uyigue on 6/4/23.
//

import UIKit

class PodcastSearchVC: UIViewController {
    
    // MARK: - View's LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchController()
        setUpTableView()
    }
    
    
    // MARK: - Properties
    private(set) var podcasts = [Podcast]()
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    static let cellIdentifier = "PodcastSearchVC-Cell"
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    
    // MARK: - Methods
    private func setUpTableView() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Self.cellIdentifier)
    }

    
    private func setUpSearchController() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
    
    // MARK: - Networking
    private func searchForPodcast(_ podcast: String) {
        Task { [weak self] in
            let podcasts = try await SearchNetworkingManager.shared.makeAPIRequest(for: podcast)
            self?.podcasts = podcasts
            self?.tableView.reloadData()
        }
    }
}


// MARK: - UISearchBarDelegate
extension PodcastSearchVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchForPodcast(searchText)
    }
}
