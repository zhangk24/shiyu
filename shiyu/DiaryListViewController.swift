//
//  DiaryListViewController.swift
//  shiyu
//
//  Created by zhangkuo on 16/3/29.
//  Copyright © 2016年 zhangkuo. All rights reserved.
//

import UIKit




var data: String = ""

class DiaryListViewController: UITableViewController {
    
    var addFlag = false
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        // whenever this view controller appears, reload the table. This allows it to reflect any changes
        // made whilst editing notes
        
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem()

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

       let diary = diarys[indexPath.row] as DiaryModel
        cell.textLabel?.text = diary.title
        cell.detailTextLabel?.text = diary.date
        


        return cell
    }
    /*

    @IBAction func close(segue: UIStoryboardSegue) {
        print("closed")
        
    }
*/
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
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
                vc.diary = diarys[index.row]
                
            }
            
        }else if segue.identifier == "AddDiary" {
            let diary = DiaryModel(title: "", content: "", date: Date2String()!)
            vc.diary = diary
            addFlag = true
            //diarys.append(diary)
        }
        
        
        
    }
    
    @IBAction func   saveDiarys(segue:UIStoryboardSegue) {
        
        
        if let diaryEditView = segue.sourceViewController as? DiaryEditViewController {
            //if let diary = diaryEditView.diary{
                if addFlag {
                    diaryEditView.diary = DiaryModel(title: diaryEditView.diaryTitle.text, content: diaryEditView.diaryContent.text, date: Date2String()!)
                    
                    diarys.append(diaryEditView.diary!)
                    addFlag = false
                    //print(addFlag)
                    
                    
                    
                } else {
                    diaryEditView.diary?.title = diaryEditView.diaryTitle.text
                    diaryEditView.diary?.content = diaryEditView.diaryContent.text
                    //diaryEditView.diary?.date = Date2String()!
                    if diaryEditView.diaryTitle.text == diaryEditView.titleLast && diaryEditView.diaryContent.text == diaryEditView.contentLast {
                        diaryEditView.diary?.date = diaryEditView.dateLast
                    } else {
                        diaryEditView.diary?.date = Date2String()!
                    }
                    
                    
                }
            
            
            
        }
        //String.WriteFile(diarys)
        //print(String.ReadFile()[4].content)
        //print(String.ReadFile()[4].title)
    }
    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
