//
//  TabBarViewController.swift
//  App
//
//  Created by Alexander Chervoncev on 29.07.22.
//

import UIKit

final class TabBarViewController: UITabBarController {

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
        makeTabItems()
    }
}

//MARK: - Private Extensions
private extension TabBarViewController {
    func setupTabbar() {
        tabBar.tintColor = .black
        tabBar.barTintColor = #colorLiteral(red: 0.7850414932, green: 0.8816119525, blue: 0.8485268404, alpha: 1)
        tabBar.unselectedItemTintColor = .gray
    }
    
    func makeTabItems() {
        let groups = MyGroupsViewController()
        let friends = FriendsViewController()
        let newsFeed = NewsFeedViewController()
        
        guard let groupsIcon = UIImage(named: "GroupsItems") else { return }
        guard let friendsIcon = UIImage(named: "FriendsItems") else { return }
        guard let newsFeedIcon = UIImage(named: "NewsItems") else { return }
       
        let groupsScene = createNavContoroller(for: groups, title: "Группы", image: groupsIcon)
        let friendsScene = createNavContoroller(for: friends, title: "Друзья", image: friendsIcon)
        let newsFeedScene = createNavContoroller(for: newsFeed, title: "Новости", image: newsFeedIcon)
        viewControllers = [friendsScene, newsFeedScene, groupsScene]
    }
    
    func createNavContoroller(for rootViewController: UIViewController,
                              title: String,
                              image: UIImage?
    ) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        rootViewController.navigationItem.title = title
        navController.navigationBar.tintColor = .black
        return navController
    }
}
