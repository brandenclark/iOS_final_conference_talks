//
//  MainViewController.swift
//  Final Clark Branden
//
//  Created by Branden Clark on 12/19/18.
//  Copyright © 2018 Branden Clark. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
   
    // MARK: - Constants
    struct Storyboard {
        static let ScripturesCitationURL = URL(string: "https://scriptures.byu.edu/")!
        static let Title = "Conference Talks"
    }
    
    
    // MARK: - Actions
    //Give credit where it's due
    @IBAction func SendToCitationIndex(_ sender: Any) {
        UIApplication.shared.open(Storyboard.ScripturesCitationURL)
    }
    
    
    // MARK: - Lifecycle Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        title = Storyboard.Title
    }
}
