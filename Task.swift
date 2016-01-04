//
//  Task.swift
//  PickThree
//
//  Created by Jason Shultz on 1/3/16.
//  Copyright © 2016 Chaos Elevators, Inc.. All rights reserved.
//

import RealmSwift
import Foundation

class Task: Object {
    
    dynamic var id = NSUUID().UUIDString
    dynamic var name = ""
    dynamic var createdDate = ""
    
    // Specify properties to ignore (Realm won't persist these)
    
    //  override static func ignoredProperties() -> [String] {
    //    return []
    //  }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
