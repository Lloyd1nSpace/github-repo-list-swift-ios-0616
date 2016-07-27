//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
        
    class func getRepositoriesWithCompletion(completion: (NSArray) -> ()) {
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())

        if let githubURL = NSURL(string: "https://api.github.com/repositories?client_id=clientID&client_secret=secret") {
            
            let githubTask = session.dataTaskWithURL(githubURL, completionHandler: {
                (data, response, error) in if let data = data {
                    do {
                        let responseData = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSArray
                            if let responseData = responseData {completion(responseData)}
                    } catch {
                        print("Bloop")
                    }
                }
            })
        githubTask.resume()
        }
    }
}