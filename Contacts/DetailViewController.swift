//
//  DetailViewController.swift
//  Contacts
//
//  Created by Austin Murtha on 3/29/15.
//  Copyright (c) 2015 AustinMurtha. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    var contact: Contacts?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // Why unwrap at contact instead of at the end??
        
        nameLabel.text = contact!.firstName + " " + contact!.lastName
        
        phoneNumberLabel.text = contact!.cellPhoneNumber
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
