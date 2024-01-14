//
//  ViewController.swift
//  Movie app
//
//  Created by Eva Sira Madarasz on 20/10/2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        
        let vc2 = UINavigationController(rootViewController: UpcomingViewController())
        
        let vc3 = UINavigationController(rootViewController: SearchViewController())


        let vc4 = UINavigationController(rootViewController: BookmarkViewController())
        
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "bookmark.fill")
        
        vc1.title = "Home"
        vc2.title = "Coming soon"
        vc3.title = "Top Search"
        vc4.title = "Bookmark"
        
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1, vc2, vc3,vc4], animated: true)
    }


}

