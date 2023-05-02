//
//  MainTabBarViewController.swift
//  TrashMap
//
//  Created by Павел Кай on 26.04.2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       setTabBar()
    }
    
    func setTabBar() {
        let trashTable = UINavigationController(rootViewController: TrashListViewController())
        trashTable.tabBarItem.title = "Список Мусора"
        trashTable.tabBarItem.image = UIImage(systemName: "trash.fill")
        
        let trashMap = UINavigationController(rootViewController: TrashMapViewController())
        trashMap.tabBarItem.title = "Карта Мусора"
        trashMap.tabBarItem.image = UIImage(systemName: "map.circle")
        
        setViewControllers([trashTable, trashMap], animated: true)
    }

}
