//
//  LogItem.swift
//  MoreVeggiesApp
//
//  Created by Adams, James on 5/14/15.
//  Copyright (c) 2015 LaCharite, Noelle. All rights reserved.
//

import Foundation
import CoreData

class LogItem: NSManagedObject {

    @NSManaged var itemText: String
    @NSManaged var title: String

}
