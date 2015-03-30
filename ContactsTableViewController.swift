//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Austin Murtha on 3/27/15.
//  Copyright (c) 2015 AustinMurtha. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    var contactsArray = [Contacts]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tim = Contacts(firstName: "Tim", lastName: "Smith", cellPhoneNumber: "888-555-1212")
        var jon = Contacts(firstName: "Jon", lastName: "Doe", cellPhoneNumber: "800-333-1212")
        self.contactsArray.append(tim)
        self.contactsArray.append(jon)
        
        let moveButton = UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: Selector("toggleEdit"))
        self.navigationItem.leftBarButtonItem = moveButton
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    // MARK: - Table view data source
    
    func toggleEdit() {
        self.tableView.setEditing(!self.tableView.editing, animated: true)
        let doneButton = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = doneButton
        
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if tableView.editing{
            return .None
        } else {
            return .Delete
        }
    }
    
    override func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let contactMoving = self.contactsArray.removeAtIndex(sourceIndexPath.row)
        self.contactsArray.insert(contactMoving, atIndex: destinationIndexPath.row)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Talk to Eric about this
        //let indexPath = self.tableView.indexPathForCell(sender as UITableView)!
        let indexPath = self.tableView.indexPathForCell(sender as UITableViewCell)!
        let contact = self.contactsArray[indexPath.row]
        
        var destination = segue.destinationViewController as DetailViewController
        destination.contact = contact
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.contactsArray.count
        
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        //cell.textLabel?.text = "A fine example of a UITableViewCell"
        let contact = contactsArray[indexPath.row]
        cell.textLabel?.text = contact.firstName

        
        return cell
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            self.contactsArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
