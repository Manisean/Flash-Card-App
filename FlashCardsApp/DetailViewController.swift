//
//  DetailViewController.swift
//  FlashCardsApp
//
//  Created by Mark Hunnewell on 3/22/24.
//

import UIKit

class DetailViewController : UIViewController {
    
    var engWrd: String?
    var frWrd: String?
    
    var selected: Int?
    
    var engLabel = UILabel()
    var frLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(engLabel)
        engLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(frLabel)
        frLabel.translatesAutoresizingMaskIntoConstraints = false
        
        if selected == 0 {
            let engConst = 0.5
            let frConst = 0.6
            manager(engConst: engConst, frConst: frConst)
        } else if selected == 1 {
            let engConst = 0.6
            let frConst = 0.5
            manager(engConst: engConst, frConst: frConst)
        }
        
    }
    
    func manager(engConst: Double, frConst: Double) {
        let constraints = [
            NSLayoutConstraint(item: engLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: engLabel, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: engConst, constant: 0),
            NSLayoutConstraint(item: frLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: frLabel, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: frConst, constant: 0)
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }

        engLabel.text = engWrd
        frLabel.text = frWrd
    }
    
}
