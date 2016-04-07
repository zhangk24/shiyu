//
//  SampleData.swift
//  shiyu
//
//  Created by zhangkuo on 16/3/29.
//  Copyright © 2016年 zhangkuo. All rights reserved.
//

import Foundation
func Date2String() -> String? {
    let date = NSDate()
    let formatter = NSDateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm"
    return formatter.stringFromDate(date)
}

let diarysData = [
    DiaryModel(title: "测试1", content: "这是测试出怎么养啊啊啊", date: Date2String()!),
    DiaryModel(title: "Test2", content: "点点滴滴广告时说", date: Date2String()!),
    DiaryModel(title: "测试3", content: "z啊啊啊这份共商国是测试", date: Date2String()!)
]

