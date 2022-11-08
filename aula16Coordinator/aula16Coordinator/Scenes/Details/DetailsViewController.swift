//
//  DetailsViewController.swift
//  aula16Coordinator
//
//  Created by Rogério Tavares on 04/04/22.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
    
    var viewModel: DetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel?.title
    }
}
