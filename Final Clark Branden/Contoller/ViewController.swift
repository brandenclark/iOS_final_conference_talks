//
//  ViewController.swift
//  Final Clark Branden
//
//  Created by Branden Clark on 12/18/18.
//  Copyright © 2018 Branden Clark. All rights reserved.
//

import UIKit

class SessionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(CitationDatabase.sharedDatabase.conferenceList())
    }


}

