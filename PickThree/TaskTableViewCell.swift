//
//  TaskTableViewCell.swift
//  PickThree
//
//  Created by Jason Shultz on 1/18/16.
//  Copyright © 2016 HashRocket. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    @IBAction func cellButton(sender: AnyObject) {
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: taskLabel.text!)
        attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, attributeString.length))
        taskLabel.attributedText = attributeString;
        
    }
    
    @IBOutlet weak var cellButtonText: UIButton!
    
    
    @IBOutlet weak var taskLabel: UILabel!
    
    func configure(name:String, rowNumber:Int) {
        
        taskLabel.text = name
        
        cellButtonText.setTitle("\(rowNumber)", forState: UIControlState.Normal)
        
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
