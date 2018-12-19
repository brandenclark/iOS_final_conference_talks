//
//  ConferenceViewController.swift
//  Final Clark Branden
//
//  Created by Branden Clark on 12/19/18.
//  Copyright © 2018 Branden Clark. All rights reserved.
//

import UIKit

class ConferenceViewController : UITableViewController {
    // MARK: - Constants
    private struct Storyboard {
        static let ShowBooksSequeIdentifier = "ShowSession"
        static let ConferenceCellIdentifier = "ConferenceCell"
    }
    
    let queue = DispatchQueue(label: "DatabaseHandler", attributes: .concurrent)
    
    // MARK: - Properties
    var conferences = [Conference]()
    
    // MARK: - Seques
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.ShowBooksSequeIdentifier {
            if let sessionVC = segue.destination as? SessionViewController {
                if let indexPath = sender as? IndexPath {
                    sessionVC.conferenceId = conferences[indexPath.row].id
                }
            }
        }
    }
    
    // MARK: - Lifecylce Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //load conferences from the database on seperate thread
        queue.async {
            self.conferences = CitationDatabase.sharedDatabase.conferenceList()
            
            DispatchQueue.main.sync {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conferences.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.ConferenceCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = conferences[indexPath.row].abbr
        
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Storyboard.ShowBooksSequeIdentifier, sender: indexPath)
    }
    
    // MARK: - Helpers
}

