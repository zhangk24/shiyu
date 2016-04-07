//
//  DiaryContent.swift
//  shiyu
//
//  Created by zhangkuo on 16/3/29.
//  Copyright © 2016年 zhangkuo. All rights reserved.
//

import UIKit



class DiaryModel: NSObject {
    
    var title: String
    var content: String
    var date: String
    
    init(title: String, content: String, date: String){
        self.title = title
        self.content = content
        self.date = date
    }
}

