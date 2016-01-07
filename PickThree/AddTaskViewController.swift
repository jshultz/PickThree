//
//  AddTaskViewController.swift
//  PickThree
//
//  Created by Jason Shultz on 1/5/16.
//  Copyright © 2016 HashRocket. All rights reserved.
//

import UIKit
import RealmSwift

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var taskText: UITextField!
    
    let realm = try! Realm()
    
//    var task: Task? = nil
    
    var notificationToken: NotificationToken?
    
    @IBAction func submitButton(sender: AnyObject) {
        
        let task = Task()
        
        task.name = self.taskText.text!
        
        try! realm.write {
            realm.add(task)
            performSegueWithIdentifier("returnHome", sender: self)
        }
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
