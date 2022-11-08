//
//  HomeViewModel.swift
//  aula16Coordinator
//
//  Created by Rogério Tavares on 04/04/22.
//

import Foundation

class HomeViewModel {
    let title = "Home"
    
    var coordinator: HomeCoordinator?
    
    func tapDetails() {
        coordinator?.details()
    }
}
