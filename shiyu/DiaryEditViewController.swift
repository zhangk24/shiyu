//
//  DiaryEditViewController.swift
//  shiyu
//
//  Created by zhangkuo on 16/3/29.
//  Copyright © 2016年 zhangkuo. All rights reserved.
//

import UIKit

class DiaryEditViewController: UIViewController, UITextViewDelegate {

    //@IBOutlet weak var diaryTitle: UITextView!
    
    //@IBOutlet weak var diaryContent: UITextView!
    
    @IBOutlet weak var diaryTitle: UITextView!
    
    @IBOutlet weak var diaryContent: UITextView!
    
  
    
    var diary: DiaryModel?
    var dateLast: String = ""
    var titleLast: String = ""
    var contentLast: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //diaryTitle.delegate = self
        //diaryContent.delegate = self
        //diaryTitle.text = diary?.title
        
        
        
        if (diary?.content == "") {
            diaryTitle.text = ""
            diaryContent.text = ""
            title = "编辑"
        } else {
            diaryTitle.text = diary?.title
            diaryContent.text = diary?.content
            title = "编辑"
            
            
        }
        
        titleLast = (diary?.title)!
        contentLast = (diary?.content)!        
        dateLast = (diary?.date)!
        
        
       
        
        

    
        
        // Do any additional setup after loading the view.
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    func textViewDidEndEditing(textView: UITextView) {
        diary?.title = diaryTitle.text
        diary?.content = diaryContent.text
        
    }
*/
    
    /*
    @IBAction func saveTapped(sender: AnyObject) {
        diaryContent.resignFirstResponder()
        if diary == nil {
            diary = DiaryModel(title: diaryTitle.text, content: diaryContent.text, date: Date2String()!)
            
            
            
        } else {
            diary?.title = diaryTitle.text
            diary?.content = diaryContent.text
            diary?.date = Date2String()!
            
        }
      
        
    }
*/
    
    
    
    
    
    //
    /*
    func textViewShouldReturn(textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    
    
    func textViewShouldEndEditing(textView: UITextView) -> Bool {
        //print(diaryContent.text)
        return true
    }
    */
    
    
    
}
