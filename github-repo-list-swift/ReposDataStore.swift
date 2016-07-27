//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    var repositories = [GithubRepository]()
    
    func getRepositoriesWithCompletion(completion: () -> ()) {
        
        GithubAPIClient.getRepositoriesWithCompletion { (githubArray) in
            self.repositories.removeAll()
            for repo in githubArray {
                guard let gitRepo = repo as? NSDictionary else {return}
                self.repositories.append(GithubRepository.init(dictionary: gitRepo))
            }
            print(githubArray)
            completion()
        }
    }
}