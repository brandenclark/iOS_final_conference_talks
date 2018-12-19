//
//  SessionViewController.swift
//  Final Clark Branden
//
//  Created by Branden Clark on 12/19/18.
//  Copyright © 2018 Branden Clark. All rights reserved.
//

import UIKit

class SessionViewController: UITableViewController {
    
    // MARK: - Constants
    private struct Storyboard {
        static let ConferenceCellIdentifier = "TalkCell"
        static let ShowBooksSequeIdentifier = "ShowTalk"
        static let Title = "Talks"
    }
    
    let queue = DispatchQueue(label: "DatabaseHandler", attributes: .concurrent)
    
    
    // MARK: - Properties
    var conferenceId = 0
    var talks = [ConferenceTalk]()
    
    
    // MARK: - Seques
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.ShowBooksSequeIdentifier {
            if let talkVC = segue.destination as? TalkViewController {
                //send talk to the TalkViewController
                if let indexPath = sender as? IndexPath {
                    talkVC.talkId = talks[indexPath.row].id
                    talkVC.talkName = talks[indexPath.row].title
                }
            }
        }
    }
    
    
    // MARK: - Lifecylce Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        title = Storyboard.Title
        
        //load conferences from the database on seperate thread
        queue.async {
            self.talks = CitationDatabase.sharedDatabase.talksForConferenceId(self.conferenceId)

            DispatchQueue.main.sync {
                self.tableView.reloadData()
            }
        }
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return talks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.ConferenceCellIdentifier, for: indexPath)
        
        //Split up the description to get rid of the date
        let descriptionArr = talks[indexPath.row].description.components(separatedBy: ", ")
        
        cell.textLabel?.text = talks[indexPath.row].title
        cell.detailTextLabel?.text = (talks[indexPath.row].speakerLastName +
                                        ", " +
                                        (talks[indexPath.row].speakerFirstName) +
                                        " - " +
                                        descriptionArr[0])
        
        return cell
    }
    
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Storyboard.ShowBooksSequeIdentifier, sender: indexPath)
    }
}
