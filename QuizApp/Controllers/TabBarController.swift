//
//  TabBarController.swift
//  QuizApp
//
//  Created by Adil Gumarov on 18.01.2023.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let menuVC = MainPageViewController() // UINavigationController(rootViewController: MainPageViewController())
        let settingVC = UINavigationController(rootViewController: SettingViewController()) //SettingViewController() 
        
        menuVC.title = "Home"
        settingVC.title = "Ranking"
        
        setViewControllers([menuVC, settingVC], animated: false)
        
        let images = ["house", "trophy.fill"]
        guard let items = tabBar.items else { return }
        
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: images[i])
        }
        
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
        
    }
    
}
