//
//  DetailViewController.swift
//  desafioNavigation
//
//  Created by Rogério Tavares on 15/03/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    static var identifier = "DetailsViewController"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    private var details: TableViewData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let details = details {
            titleLabel.text = details.title
            messageLabel.text = details.message
        }
    }
    
    func setup(details: TableViewData) {
        self.details = details
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
