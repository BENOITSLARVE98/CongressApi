//
//  DetailsViewController.swift
//  BenoitSlarveCE05
//
//  Created by Slarve N. on 01/19/2020.
//  Copyright © 2019 Slarve N. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var Dimage: UIImageView!
    @IBOutlet weak var DName: UILabel!
    @IBOutlet weak var DTitle: UILabel!
    @IBOutlet weak var DParty: UILabel!
    @IBOutlet weak var DState: UILabel!
    
    var congress: Congress!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if congress != nil {
            DName.text = congress.fullName
            DTitle.text = "Title: \(congress.title)"
            DState.text = "State: \(congress.state)"
            
            if congress.party == "D" {
                DParty.text = "Party: Democrat"
                self.view.backgroundColor = UIColor.blue
            }
            else if congress.party == "R" {
                DParty.text = "Party: Republican"
                self.view.backgroundColor = UIColor.red
            }
            else {
                DParty.text = "Party: Independent"
                self.view.backgroundColor = UIColor.purple
            }
            
            //If there is an image present use it, else use default images
            if let img = congress.id {
                Dimage.image = img
            }
            else {
                if congress.party == "R" {
                    Dimage.image = UIImage(named: "RepublicanImage")
                }
                else {
                    Dimage.image = UIImage(named: "DemocratImage")
                }
            }
            
            self.navigationItem.title = congress.fullName
            
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
