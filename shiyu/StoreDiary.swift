//
//  StoreDiary.swift
//  shiyu
//
//  Created by zhangkuo on 16/3/31.
//  Copyright © 2016年 zhangkuo. All rights reserved.
//

import UIKit


extension String {
    static func WriteFile(diarys: [DiaryModel]){
        
        var writeString: String = ""
        
        for index in 0...diarys.count-1 {
            writeString += diarys[index].title + "#" + diarys[index].content + "#" + diarys[index].date + "@"
        }
       
        //设定路径
        //let url: NSURL = NSURL(fileURLWithPath: "/Users/Shared/diary.txt")
        //let path = NSBundle.mainBundle().pathForResource("diary", ofType: "txt")
        //print(path)
        //let url: NSURL = NSURL(fileURLWithPath: path!)
        let url = NSHomeDirectory() + "/Documents/diary.txt"
        //print(url.path!)
        //定义可变数据变量
        let data = NSMutableData()
        //向数据对象中添加文本，并制定文字code
        data.appendData(writeString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!)
        //用data写文件
        data.writeToFile(url, atomically: true)
       
        
     
        
    }
    
    static func ReadFile()->[DiaryModel] {
        
        var diarys = [DiaryModel]()
        
        //设定路径
        //let url: NSURL = NSURL(fileURLWithPath: "/Users/Shared/diary.txt")
        //let path = NSBundle.mainBundle().pathForResource("diary", ofType: "txt")
        //print(path)
        //let url: NSURL = NSURL(fileURLWithPath: path!)
        let url = NSHomeDirectory() + "/Documents/diary.txt"
        if NSData(contentsOfFile: url) != nil {
            var data = String(data: NSData(contentsOfFile: url)!, encoding: NSUTF8StringEncoding)!
             //print(data)
            data.removeAtIndex(data.endIndex.predecessor())
            let arrayString = data.componentsSeparatedByString("@")
            //print(arrayString.count)
            for index in 0...arrayString.count-1 {
                //diarys.append(diary)
                
                //diary.title = arrayString[index].componentsSeparatedByString("#")[0]
                //diary.content = arrayString[index].componentsSeparatedByString("#")[1]
                //diary.date = arrayString[index].componentsSeparatedByString("#")[2]
                //let tmp = diary
                diarys.append(DiaryModel(title: arrayString[index].componentsSeparatedByString("#")[0], content: arrayString[index].componentsSeparatedByString("#")[1], date: arrayString[index].componentsSeparatedByString("#")[2]))
                //diarys[index] = diary
                
                //print(diarys[0].content)
                
                
            }
        }
      
        return diarys
        
        
        
    }
    
   
    
}



