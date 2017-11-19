//
//  SideMenuTableViewController.swift
//  myBalance
//
//  Created by Andrew Mogg on 11/18/17.
//  Copyright © 2017 Andrew Mogg. All rights reserved.
//

import UIKit

class SideMenuTableViewController: UITableViewController {
    var tableViewRowHeight: CGFloat = 117.0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 7
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let row: Int = indexPath.row
        
        // Populating the calories burned row
        if row == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileSettings")! as! ProfileSettingsTableViewCell
            
            // Grab the row count from the indexPath in the cell
            //cell.thumbnailImage!.image = UIImage(named: "CaloriesBurnedIcon")
            cell.titleLabel!.text = "Profile Settings"
            
            return cell
        }
            
        else if row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Notifications")! as! NotificationsTableViewCell
            
            // Grab the row count from the indexPath in the cell
            //cell.thumbnailImage!.image = UIImage(named: "CaloriesBurnedIcon")
            cell.titleLabel!.text = "Notifications"
            
            return cell
        }
            
        else if row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyNetwork")! as! MyNetworkTableViewCell
            
            // Grab the row count from the indexPath in the cell
            //cell.thumbnailImage!.image = UIImage(named: "CaloriesBurnedIcon")
            cell.titleLabel!.text = "myNetwork"
            
            return cell
        }
        
        else if row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Upgrade")! as! UpgradeTableViewCell
            
            // Grab the row count from the indexPath in the cell
            //cell.thumbnailImage!.image = UIImage(named: "CaloriesBurnedIcon")
            cell.titleLabel!.text = "Update to Premium"
            
            return cell
        }
        else if row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Help")! as! HelpTableViewCell
            
            // Grab the row count from the indexPath in the cell
            //cell.thumbnailImage!.image = UIImage(named: "CaloriesBurnedIcon")
            cell.titleLabel!.text = "App Help"
            
            return cell
        }
            
        else if row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TermsOfService")! as! TermsOfServiceTableViewCell
            
            // Grab the row count from the indexPath in the cell
            //cell.thumbnailImage!.image = UIImage(named: "CaloriesBurnedIcon")
            cell.titleLabel!.text = "Terms of Service"
            
            return cell
        }
            
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LogOut")! as! LogOutTableViewCell
            
            // Grab the row count from the indexPath in the cell
            //cell.thumbnailImage!.image = UIImage(named: "CaloriesBurnedIcon")
            cell.titleLabel!.text = "Log Out"
            
            return cell
        }
        

    }
    
    // Asks the table view delegate to return the height of a given row.
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return tableViewRowHeight
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
