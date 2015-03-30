//
//  DetailViewController.swift
//  Contacts
//
//  Created by Austin Murtha on 3/29/15.
//  Copyright (c) 2015 AustinMurtha. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var phoneNumberLabel: UITextField!
    
    @IBOutlet weak var lastNameLabel: UITextField!
    
    var contact: Contacts?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //ask about delegates
        self.nameLabel.delegate = self
        self.lastNameLabel.delegate = self
        self.phoneNumberLabel.delegate = self
        
        // Why unwrap at contact instead of at the end??
        // Why did self work here and not without self
        self.nameLabel.text = contact!.firstName
        self.lastNameLabel.text = contact!.lastName
        self.phoneNumberLabel.text = contact!.cellPhoneNumber
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if textField == self.nameLabel {
            self.contact?.firstName = textField.text
        } else if textField == self.phoneNumberLabel{
            self.contact?.cellPhoneNumber == textField.text
        } else if textField == self.lastNameLabel {
            self.contact?.lastName = textField.text
        }
        
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
