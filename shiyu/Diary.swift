//
//  Diary.swift
//  shiyu
//
//  Created by zhangkuo on 16/4/16.
//  Copyright © 2016年 zhangkuo. All rights reserved.
//

import Foundation
import CoreData


@objc(Diary)
class Diary: NSManagedObject {
    
    // Insert code here to add functionality to your managed object subclass
    @NSManaged var content: String
    @NSManaged var createdtime: NSDate
    @NSManaged var location: String?
    @NSManaged var month: NSNumber
    @NSManaged var title: String?
    @NSManaged var year: NSNumber
    
}
