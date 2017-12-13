//
//  TrackTableViewController.swift
//  myBalance
//
//  Created by Andrew Mogg on 12/12/17.
//  Copyright © 2017 Andrew Mogg. All rights reserved.
//

import UIKit

class TrackTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get the current date and time
        let currentDateTime = Date()
        
        // initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        
        // get the date time String from the date object
        
        self.title = formatter.string(from: currentDateTime)
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
        return 8
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let row: Int = indexPath.row
        
        // Populating the calories burned row
        if row == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Sleep")! as! SleepTableViewCell
            
            // Grab the row count from the indexPath in the cell
            //cell.thumbnailImage!.image = UIImage(named: "CaloriesBurnedIcon")
            cell.titleLabel!.text = "Sleep"
            
            return cell
        }
            
        else if row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Stress")! as! StressTableViewCell
            
            // Grab the row count from the indexPath in the cell
            //cell.thumbnailImage!.image = UIImage(named: "CaloriesBurnedIcon")
            cell.titleLabel!.text = "Stress"
            
            return cell
        }
            
        else if row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Interests")! as! InterestsTableViewCell
            
            // Grab the row count from the indexPath in the cell
            //cell.thumbnailImage!.image = UIImage(named: "CaloriesBurnedIcon")
            cell.titleLabel!.text = "Interest in Activities"
            
            return cell
        }
            
        else if row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Concentration")! as! ConcentrationTableViewCell
            
            // Grab the row count from the indexPath in the cell
            //cell.thumbnailImage!.image = UIImage(named: "CaloriesBurnedIcon")
            cell.titleLabel!.text = "Concentration"
            
            return cell
        }
        else if row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Irritability")! as! IrritabilityTableViewCell
            
            // Grab the row count from the indexPath in the cell
            //cell.thumbnailImage!.image = UIImage(named: "CaloriesBurnedIcon")
            cell.titleLabel!.text = "Irritability"
            
            return cell
        }
            
        else if row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Body")! as! BodyTableViewCell
            
            // Grab the row count from the indexPath in the cell
            //cell.thumbnailImage!.image = UIImage(named: "CaloriesBurnedIcon")
            cell.titleLabel!.text = "Body"
            
            return cell
        }
        else if row == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Performance")! as! PerformanceTableViewCell
            
            // Grab the row count from the indexPath in the cell
            //cell.thumbnailImage!.image = UIImage(named: "CaloriesBurnedIcon")
            cell.titleLabel!.text = "Performance"
            
            return cell
        }
            
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EatingHabits")! as! EatingHabitsTableViewCell
            
            // Grab the row count from the indexPath in the cell
            //cell.thumbnailImage!.image = UIImage(named: "CaloriesBurnedIcon")
            cell.titleLabel!.text = "Eating Habits"
            
            return cell
        }
        
        
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
