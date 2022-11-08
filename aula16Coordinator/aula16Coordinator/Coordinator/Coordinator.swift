//
//  Coordinator.swift
//  aula16Coordinator
//
//  Created by Rogério Tavares on 04/04/22.
//

import Foundation

protocol Coordinator: AnyObject {
    var childCoordinator: [Coordinator] { get }
    func start()
}
