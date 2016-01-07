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
    
    var cellContent = ["john", "jacob", "jingleheimer", "schmidt"]
    let realm = try! Realm()
    var array = try! Realm().objects(Task)
    var notificationToken: NotificationToken?
    var activeTask = -1

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.taskTable.dataSource = self
        self.taskTable.delegate = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = cellContent[indexPath.row]
        print("thing: ",cellContent[indexPath.row])
        
        let object = array[indexPath.row]
        
        cell.textLabel?.text = object.name

        print("object: ", object)

//        if let textField = cell.viewWithTag(10) as? UILabel {
//            print("here i am")
//            textField.text = object
//        }
//
//        if let button = cell.viewWithTag(20) as? UIButton {
//            button.setTitle("\(indexPath.row)", forState: UIControlState.Normal)
//        }
//
//        if let label = cell.viewWithTag(30) as? UILabel {
//            label.text = object
//        }
        
        return cell
    }
    
//
//    var cellContent = ["john", "jacob", "jingleheimer", "schmidt"]
//    
    @IBOutlet weak var taskTable: UITableView!
//
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return array.count
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
//        
//        let object = array[indexPath.row]
//        
//        print("object: ", object)
//        
//        if let textField = cell.viewWithTag(10) as? UILabel {
//            print("here i am")
//            textField.text = object
//        }
//        
//        if let button = cell.viewWithTag(20) as? UIButton {
//            button.setTitle("\(indexPath.row)", forState: UIControlState.Normal)
//        }
//        
//        if let label = cell.viewWithTag(30) as? UILabel {
//            label.text = object
//        }
//        
//        return cell
//    }
//    
//    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
//        print("indexPath: ", indexPath)
//        activeTask = indexPath.row
//        return indexPath
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        self.taskTable.dataSource = self
//        self.taskTable.delegate = self
//        
//        
//        notificationToken = realm.addNotificationBlock { [unowned self] note, realm in
//            self.taskTable.reloadData()
//        }
//
//        // Do any additional setup after loading the view, typically from a nib.
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

