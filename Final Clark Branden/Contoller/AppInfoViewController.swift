//
//  AppInfoViewController.swift
//  Final Clark Branden
//
//  Created by Branden Clark on 12/19/18.
//  Copyright © 2018 Branden Clark. All rights reserved.
//

import UIKit

class AppInfoViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var UpdateLabel: UILabel!
    
    
    // MARK: - Lifecycle Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        UpdateLabel.text = ("Updated: " + CitationDatabase.sharedDatabase.updatedDate())
    }
}
