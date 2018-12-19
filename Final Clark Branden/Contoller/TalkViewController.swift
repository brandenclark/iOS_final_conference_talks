//
//  TalkViewController.swift
//  Final Clark Branden
//
//  Created by Branden Clark on 12/19/18.
//  Copyright © 2018 Branden Clark. All rights reserved.
//

import UIKit
import WebKit

class TalkViewController: UIViewController {
   
    // MARK: - Constants
    struct Storyboard {
        static let baseURL = "https://scriptures.byu.edu/content/talks_ajax/"
    }
    
    let queue = DispatchQueue(label: "DatabaseHandler", attributes: .concurrent)
    
    
    // MARK: - Outlets
    @IBOutlet weak var webView: WKWebView!
    
    
    // MARK: - Properties
    var talkId = 0
    var talkName = ""
    
    
    // MARK: - Lifecycle Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        title = talkName
        
        queue.async {
            let urlString = (Storyboard.baseURL + String(self.talkId))
            
            self.webView.load(URLRequest(url: URL(string: urlString)!))
        }
    }
}
