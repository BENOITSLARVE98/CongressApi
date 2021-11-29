//
//  TVC_Extension.swift
//  BenoitSlarveCE05
//
//  Created by Slarve N. on 01/19/2020.
//  Copyright © 2019 Slarve N. All rights reserved.
//

import UIKit

extension TableViewController {


    func downloadJSON() {
        
        //Create default configuration
        let config = URLSessionConfiguration.default
        
        //Create a session
        let session = URLSession(configuration: config)
        
        //Validate url to ensure it is not a broken link
        if let validUrl = URL(string: "https://api.propublica.org/congress/v1/116/senate/members.json") {
            
                //Create a URLRequest passing in validUrl for our header
            var request = URLRequest(url: validUrl)
            
            //Set the header values. These are case sensitive and must be exact
            request.setValue("uRRucftKwodoCvIMd3EEeJwxx55sRbRqvoYomHMB", forHTTPHeaderField: "X-API-Key")//ProPublica API header key
            
            //What type of request is this
            request.httpMethod = "GET"
            
            //Create a task to send the request and download whatever is found at validUrl
            //Make sure that you are choosing the correct dataTask with URLRequest and not URL
            let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            
                //Bail Out on error
                if error != nil { return }
                //print(opt_data)
                //Check the response, statusCode, and data
                guard let response = response as? HTTPURLResponse,
                    response.statusCode == 200,
                    let data = data
                    else { return }
                
                
                do {
                    //De-Serialize data object
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        
                        for firstLevelItem in json {
                            guard let result = firstLevelItem.value as? [[String: Any]]
                                else { continue
                            }
                            for item in result {
                                guard let members = item["members"] as? [[String: Any]]
                                    else { continue
                                }
                                for m in members {
                                    guard let title = m["title"] as? String,
                                          let firstName = m["first_name"] as? String,
                                          let lastName = m["last_name"] as? String,
                                          let party = m["party"] as? String,
                                          let state = m["state"] as? String,
                                          let id  = m["id"] as? String
                                        else { continue
                                    }
                                    self.congress.append(Congress(firstName: firstName, lastName: lastName, title: title, party: party, state: state, image: id))
                                }
                            }
                        }
                        
                    }
                }
                catch {
                    print(error.localizedDescription)
                    assertionFailure();
                }

                //Do UI Stuff
                DispatchQueue.main.async {
                    self.filterPostsBySubreddit()
                    self.tableView.reloadData()
                }
                
            })
            //Always have to start the task
            task.resume();
        }
        
    }
    
    
    func downloadJSO() {
        
        //Create default configuration
        let config = URLSessionConfiguration.default
        
        //Create a session
        let session = URLSession(configuration: config)
        
        //Validate url to ensure it is not a broken link
        if let validUrl = URL(string: "https://api.propublica.org/congress/v1/116/house/members.json") {
            
                //Create a URLRequest passing in validUrl for our header
            var request = URLRequest(url: validUrl)
            
            //Set the header values. These are case sensitive and must be exact
            request.setValue("uRRucftKwodoCvIMd3EEeJwxx55sRbRqvoYomHMB", forHTTPHeaderField: "X-API-Key")//ProPublica API header key
            
            //What type of request is this
            request.httpMethod = "GET"
            
            //Create a task to send the request and download whatever is found at validUrl
            //Make sure that you are choosing the correct dataTask with URLRequest and not URL
            let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            
                //Bail Out on error
                if error != nil { return }
                //print(opt_data)
                //Check the response, statusCode, and data
                guard let response = response as? HTTPURLResponse,
                    response.statusCode == 200,
                    let data = data
                    else { return }
                
                
                do {
                    //De-Serialize data object
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        
                        for firstLevelItem in json {
                            guard let result = firstLevelItem.value as? [[String: Any]]
                                else { continue
                            }
                            for item in result {
                                guard let members = item["members"] as? [[String: Any]]
                                    else { continue
                                }
                                for m in members {
                                    guard let title = m["title"] as? String,
                                          let firstName = m["first_name"] as? String,
                                          let lastName = m["last_name"] as? String,
                                          let party = m["party"] as? String,
                                          let state = m["state"] as? String,
                                          let id  = m["id"] as? String
                                        else { continue
                                    }
                                    self.congress.append(Congress(firstName: firstName, lastName: lastName, title: title, party: party, state: state, image: id))
                                }
                                
                            }
                        }
                    }
                }
                catch {
                    print(error.localizedDescription)
                    assertionFailure();
                }

                //Do UI Stuff
                DispatchQueue.main.async {
                    self.filterPostsBySubreddit()
                    self.tableView.reloadData()
                }
                
            })
            //Always have to start the task
            task.resume();
        }
        
    }

    func filterPostsBySubreddit() {
        filteredCongress[0] = congress.filter({ $0.party == "R" })
        filteredCongress[1] = congress.filter({ $0.party == "D" })
        filteredCongress[2] = congress.filter({ $0.party == "ID" })
    }
}
