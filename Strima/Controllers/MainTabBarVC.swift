//
//  ViewController.swift
//  Strima
//
//  Created by GO on 3/26/23.
//

import UIKit

class MainTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let homeScreen = UINavigationController(rootViewController: HomeVC())
        let upcomingScreen = UINavigationController(rootViewController: UpcomingVC())
        let searchScreen = UINavigationController(rootViewController: SearchVC())
        let downloadScreen = UINavigationController(rootViewController: DownloadVC())
        
        homeScreen.tabBarItem.image = UIImage(systemName: "house")
        upcomingScreen.tabBarItem.image = UIImage(systemName: "play.circle")
        searchScreen.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        downloadScreen.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        homeScreen.tabBarItem.title = "Home"
        upcomingScreen.tabBarItem.title = "Coming soon"
        searchScreen.tabBarItem.title = "Top search"
        downloadScreen.tabBarItem.title = "Downloads"
        
        tabBar.tintColor = .label
        
        setViewControllers([homeScreen, upcomingScreen, searchScreen, downloadScreen], animated: true)
    }


}

