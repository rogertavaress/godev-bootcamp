//
//  AppCoordinator.swift
//  aula16Coordinator
//
//  Created by Rogério Tavares on 04/04/22.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    private(set) var childCoordinator: [Coordinator] = []
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        
        childCoordinator.append(homeCoordinator)
        
        homeCoordinator.start()
        
        window.rootViewController = navigationController
        
        window.makeKeyAndVisible()
    }
}
