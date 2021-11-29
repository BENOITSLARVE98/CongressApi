//
//  Congress.swift
//  BenoitSlarveCE05
//
//  Created by Slarve N. on 01/19/2020.
//  Copyright © 2019 Slarve N. All rights reserved.
//

import Foundation
import UIKit

class Congress {
    
    /* Stored Properties */
    var firstName: String
    var lastName: String
    var title: String
    var party: String
    var state: String
    var id : UIImage!

    /* Computed Properties */
    var fullName: String {
        get {return "\(firstName) \(lastName)"}
    }

    /* Initializers */
    init(firstName: String, lastName: String, title: String, party: String, state: String, image: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.title = title
        self.party = party
        self.state = state
        
        //Our init will take care of dowloading the image
        if let url = URL(string: "https://theunitedstates.io/images/congress/225x275/\(image).jpg") {

            do {
                let data = try Data(contentsOf: url)
                self.id = UIImage(data: data)
            }
            catch  {

            }
        }
    }
}
