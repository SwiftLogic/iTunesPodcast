//
//  MainTabBarVC.swift
//  iTunesPodcast
//
//  Created by Osaretin Uyigue on 6/4/23.
//

import UIKit

class MainTabBarVC: UITabBarController {
    
    // MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().prefersLargeTitles = true
        setUpTabBarRootViewControllers()
    }
    
    
    // MARK: - Methods
    private func setUpTabBarRootViewControllers() {
        tabBar.tintColor = .purple
        /// Favs
        let favController = UIViewController()
        let favoritesNavController = createNavController(for: favController, title: "Favorites", systemImage: "play.circle.fill")
        
        /// Search
        let searchController = PodcastSearchVC()
        let searchNavController = createNavController(for: searchController, title: "Search", systemImage: "magnifyingglass")
        
        
        /// Downloads
        let downloadsController = UIViewController()
        let downloadsNavController = createNavController(for: downloadsController, title: "Downloads", systemImage: "square.stack.fill")
        
        viewControllers = [favoritesNavController, searchNavController, downloadsNavController]
    }
    
    
    
    // MARK: - Helpers
    private func createNavController(for viewController: UIViewController,
                                     title: String,
                                     systemImage: String) -> UINavigationController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = UIImage(systemName: systemImage)
        navController.tabBarItem.title = title
        viewController.navigationItem.title = title
        return navController
    }
}
