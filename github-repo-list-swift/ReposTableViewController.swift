//
//  FISReposTableViewController.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
    
    let dataStore = ReposDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.accessibilityLabel = "tableView"
        self.dataStore.getRepositoriesWithCompletion { 
            NSOperationQueue.mainQueue().addOperationWithBlock({ 
                print("Bloop")
                self.tableView.reloadData()
            })
        }
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataStore.repositories.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("repoCell")
        let repoDict = self.dataStore.repositories[indexPath.row]
        if let fullName = repoDict.fullName {
            cell?.textLabel?.text = fullName as String
        }
        
        return cell!
    }
}