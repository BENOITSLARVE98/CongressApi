//
//  TableViewController.swift
//  BenoitSlarveCE05
//
//  Created by Slarve N. on 01/19/2020.
//  Copyright © 2019 Slarve N. All rights reserved.

import UIKit

class TableViewController: UITableViewController {
    
    var congress = [Congress]()
    var filteredCongress  = [[Congress](), [Congress](), [Congress]()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        downloadJSON()
        downloadJSO()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return filteredCongress.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredCongress[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? RedditCell
        else{return tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)}

        // Configure the cell...
        let currentCongress = filteredCongress[indexPath.section][indexPath.row]
        cell.lname.text = currentCongress.fullName
        cell.title.text = currentCongress.title
        cell.party.text = currentCongress.party
        
        //Set section background colors: red for Republicans, blue for Democrats
        if currentCongress.party == "R" {
            cell.backgroundColor = UIColor.red
        }
        else if currentCongress.party == "D" {
            cell.backgroundColor = UIColor.blue
        }
        else {
            cell.backgroundColor = UIColor.purple
        }
        
        return cell
    }
    //MARK : -Header methods
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Republicans"
        case 1:
            return "Democrats"
        case 2:
            return "Independent"
        default:
           return "Mistakes were made"
        }
    }

    //Set header height
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
     
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         //Get the new view controller using segue.destination.
         //Pass the selected object to the new view controller.
        if let indexPath = tableView.indexPathForSelectedRow {
                   let congressToSend = filteredCongress[indexPath.section][indexPath.row]
                   
                   if let destination = segue.destination as? DetailsViewController {
                    destination.congress = congressToSend
                   }
               }
    }
    

}
