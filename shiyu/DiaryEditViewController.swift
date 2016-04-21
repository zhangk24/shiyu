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
    
  
    var diary: Diary?
    var addFlag = false

   
    var dateLast: String = ""
    var titleLast: String = ""
    var contentLast: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //diaryTitle.delegate = self
        //diaryContent.delegate = self
        //diaryTitle.text = diary?.title
        
       
        
        if (addFlag) {
            diaryTitle.text = "新增"
            diaryContent.text = ""
            title = "编辑"
        } else {
            diaryTitle.text = diary?.title
            diaryContent.text = diary?.content
            title = "编辑"
            
            
        }
        /*
        titleLast = (diary?.title)!
        contentLast = (diary?.content)!        
        dateLast = (diary?.date)!
        
        
       
        diaryTitle.text = diary?.title
        diaryContent.text = diary?.content
        title = "编辑"
        */

    
        
        // Do any additional setup after loading the view.
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    @IBAction func screenShot(sender: UIButton) {
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        self.view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //Save it to the camera roll
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        
    }
    
    
    
    
    
    
    
    
    
}
