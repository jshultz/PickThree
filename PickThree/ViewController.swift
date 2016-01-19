//
//  ViewController.swift
//  PickThree
//
//  Created by Jason Shultz on 1/3/16.
//  Copyright © 2016 HashRocket. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var array = [Task]()
    
    lazy var realm:Realm = {
        return try! Realm()
    }()
    
    var notificationToken: NotificationToken?
    var activeTask = -1

    @IBOutlet weak var taskTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.taskTable.dataSource = self
        self.taskTable.delegate = self
        
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day , .Month , .Year], fromDate: date)
        
        let year =  components.year
        let month = components.month
        let day = components.day
        
        let predicate = NSPredicate(format: "year == %@ AND month == %@ AND day == %@", argumentArray: [year, month, day])
        
        array = Array(realm.objects(Task.self).filter(predicate))
        
        notificationToken = realm.addNotificationBlock { [unowned self] note, realm in
            self.taskTable.reloadData()
        }
        
        if array.count == 5 {
            if let addTaskButton = self.view.viewWithTag(90) as? UIButton? {
                addTaskButton?.enabled = false;
            }
        }

    }
    
    
    @IBAction func completeTask(sender: AnyObject) {
        
        
    }
    
    func showAlert(errorTitle:String, errorMessage:String) {
        let alert = UIAlertController(title: "\(errorTitle)", message: "\(errorMessage)", preferredStyle: .Alert) // 1
        let firstAction = UIAlertAction(title: "Ok", style: .Default) { (alert: UIAlertAction!) -> Void in
        } // 2
        alert.addAction(firstAction) // 4
        
        presentViewController(alert, animated: true, completion:nil) // 6
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        print("indexPath: ", indexPath)
        activeTask = indexPath.row
        return indexPath
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TaskTableViewCell
                
        let object = array[indexPath.row]
        
        let rowNum:Int = indexPath.row + 1
        
        cell.configure(object.name, rowNumber: rowNum)
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "newPlace" {
            
        } else if segue.identifier == "addTask" {
            if array.count == 5 {
                showAlert("Limit Reached", errorMessage: "You can only have 5 tasks a day and focus on three.")
                
            } else {

            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

