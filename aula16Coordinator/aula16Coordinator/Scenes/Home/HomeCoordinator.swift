//
//  HomeCoordinator.swift
//  aula16Coordinator
//
//  Created by Rogério Tavares on 04/04/22.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    private(set) var childCoordinator: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController()
        let viewModel = HomeViewModel()
        viewModel.coordinator = self
        homeViewController.viewModel = viewModel
        homeViewController.view.backgroundColor = .systemIndigo
        
        navigationController.setViewControllers([homeViewController], animated: true)
    }
    
    func details() {
        let detailsCoordinator = DetailsCoordinator(navigationController: navigationController)
        detailsCoordinator.parentCoordinator = self
        childCoordinator.append(detailsCoordinator)
        
        detailsCoordinator.start()
    }
}
