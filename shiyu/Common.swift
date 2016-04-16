//
//  Common.swift
//  shiyu
//
//  Created by zhangkuo on 16/4/16.
//  Copyright © 2016年 zhangkuo. All rights reserved.
//

import UIKit
import CoreData


//core data

let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

let managedContext = appDelegate.managedObjectContext





func importJSONData() {
    let filePath = NSBundle.mainBundle().pathForResource("poem", ofType: "json")
    let JSONData = try? NSData(contentsOfFile: filePath!, options: NSDataReadingOptions.MappedRead)
    
    let jsonObject = (try! NSJSONSerialization.JSONObjectWithData(JSONData!, options: NSJSONReadingOptions.MutableContainers)) as! NSDictionary
    var poemsCollection = jsonObject.valueForKey("poems") as! [String: AnyObject]
    let poems = ( poemsCollection["cn"] as! NSArray)
    
    
    
    for poem in poems {
        let entity = NSEntityDescription.entityForName("Diary", inManagedObjectContext: managedContext)
        
        let content = poem["content"] as! String
        let title = poem["title"]as? String
        //let year = poem["year"] as! NSNumber
        //let month = poem["month"]as! NSNumber
        //let createdtime = poem["created_at"] as! NSDate
        let location = poem["location"] as? String
        
        
        let diary = Diary(entity: entity!,
            insertIntoManagedObjectContext: managedContext)
        let date = NSDate()
        diary.content = content
        diary.title = title
        diary.year = NSCalendar.currentCalendar().component(NSCalendarUnit.Year, fromDate: date)
        diary.month = NSCalendar.currentCalendar().component(NSCalendarUnit.Month, fromDate: date)
        diary.location = location
        diary.createdtime = date
        //diary.updateTimeWithDate(NSDate())
    }
    
    do {
        try managedContext.save()
    } catch {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        let nserror = error as NSError
        NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
        abort()
    }
    print("Imported ")
}