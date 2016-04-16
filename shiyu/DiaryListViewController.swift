//
//  DiaryListViewController.swift
//  shiyu
//
//  Created by zhangkuo on 16/3/29.
//  Copyright © 2016年 zhangkuo. All rights reserved.
//

import UIKit

import CoreData


var data: String = ""

class DiaryListViewController: UITableViewController {
    
    var diarys = [Diary]()
    var fetchedResultsController: NSFetchedResultsController!
    var diaryCount: Int = 1
    //var sectionsCount: Int = 0
    
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        // whenever this view controller appears, reload the table. This allows it to reflect any changes
        // made whilst editing notes
        
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem()
        reloadData()
        
        
        
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return diarys.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("diaryListCell", forIndexPath: indexPath)

       let diary = fetchedResultsController.objectAtIndexPath(indexPath) as! Diary
        cell.textLabel?.text = diary.title
        let dateFormat = NSDateFormatter.dateFormatFromTemplate("yyyy-MM-dd HH:mm", options: 0, locale: NSLocale.currentLocale())
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = dateFormat
        let dateString = dateFormatter.stringFromDate(diary.createdtime)
        cell.detailTextLabel?.text = dateString        


        return cell
    }
    /*

    @IBAction func close(segue: UIStoryboardSegue) {
        print("closed")
        
    }
*/
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            
            
            managedContext.deleteObject(diarys[indexPath.row] )
            
             //diarys.removeAtIndex(indexPath.row)//managedContext.deleteObject(diary)
            do {
                try managedContext.save()
            } catch _ {
            }
            
            diarys.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    //Edit Mode
    
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: animated)
    }
    
    // Move Cell
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return editing
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
        let diary = diarys.removeAtIndex(sourceIndexPath.row)
        diarys.insert(diary, atIndex: destinationIndexPath.row)
        
    }
    
   
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController as! DiaryEditViewController
        if segue.identifier == "EditDiary" {
            
            let indexPath = tableView.indexPathForSelectedRow
            
            if let index = indexPath {
                vc.diary = fetchedResultsController.objectAtIndexPath(index) as? Diary
                
            }
            
        }else if segue.identifier == "AddDiary" {
            //let diary = nil
            //vc.diary = diary
            vc.addFlag = true
            //diarys.append(diary)
        }
        
        
        
    }
    
    @IBAction func   saveDiarys(segue:UIStoryboardSegue) {
        
        
        if let diaryEditView = segue.sourceViewController as? DiaryEditViewController {
            if let diary = diaryEditView.diary {
                diary.content = diaryEditView.diaryContent.text
                diary.title = diaryEditView.diaryTitle.text
                
                
            }else {
                
                let entity =  NSEntityDescription.entityForName("Diary", inManagedObjectContext: managedContext)
                
                let newdiary = Diary(entity: entity!,
                    insertIntoManagedObjectContext:managedContext)
                newdiary.content = diaryEditView.diaryContent.text
                
                newdiary.title = diaryEditView.diaryTitle.text
                
                newdiary.createdtime = NSDate()
                var error: NSError?
                do {
                    try managedContext.save()
                } catch let error1 as NSError {
                    error = error1
                    print("Could not save \(error), \(error?.userInfo)")
                }
                //diarys.append(newdiary)
                

                
            }
           reloadData()
            
            
            
        }
 
    }
    
    func reloadData() {
        do {
            let fetchRequest = NSFetchRequest(entityName: "Diary")
            
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
            fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedContext, sectionNameKeyPath: nil, cacheName: nil)
            
            try self.fetchedResultsController.performFetch()
            
            if (fetchedResultsController.fetchedObjects!.count == 0) {
                print("Present empty year")
                importJSONData()
                if let sectionsCount = fetchedResultsController.sections?.count {
                    diaryCount = sectionsCount
                    diarys = fetchedResultsController.fetchedObjects as! [Diary]
                    
                }else {
                    //sectionsCount = 0
                    diaryCount = 1
                }
            }else {
                if let sectionsCount = fetchedResultsController.sections?.count {
                    diaryCount = sectionsCount
                    diarys = fetchedResultsController.fetchedObjects as! [Diary]
                    
                }else {
                    //sectionsCount = 0
                    diaryCount = 1
                }
            }
            
            
        }catch _ {
            
        }
        tableView.reloadData()
        
    }
    


  

}
