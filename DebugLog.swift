//
//  DebugLog.swift
//  Running Go
//
//  Created by Dong Eayon on 12/1/14.
//  Copyright (c) 2014 dongeyoung(personal developer). All rights reserved.
//

/* ------------------------------------------------------------------------------------

Englihs:
This class I have spent a few hours to create.
The reason to create as you can see, in order to easily view the log and track the line,
there must be something can let me use, and improve the efficiency to develop.
Finally, this class has been generated.

How to use:
No need to worry, it's very simple to use.
If you want to show logs, just set the "showLog" to "true".
If you want to only show the specific class with logs. You have to change "classNameCompare" to
"true" and give the [Application Name + . + Class Name].
If you don't want to show for specific class logs, you just change the "classNameCompare"
to "false".
That's all!

---------------------------------------------------------------------------------------

中文:
我花了几个小时来创建这个类的原因就是为了简单的跟踪log和行数.
这样做能帮我提高开发的效率. 就这样, 这个类诞生了.

怎么用:
别担心, 真心不难.
你要是想要打印 log, 只需要设置 "showLog" 为 "true".
如果你只想打印有一个类的 log, 只需要设置 "showLog" 为 "true" 然后设置变量 className 为
[应用名 + . + 类名]
如果你不想打印有个类的 log, 只需要设置 "classNameCompare" 为 false.
就这么简单!

---------------------------------------------------------------------------------------

Demo: DebugLog.print(description: "Hello World", number: 1, atLine:__LINE__, classDotSelf: ViewController.self)

------------------------------------------------------------------------------------- */

import Foundation

struct DebugConfig {
    let showLog = true // If true -> print log
    
    let classNameCompare = true
    // Filter: App Name + . + className
    let className = "Running_Go." + "PlayerViewController"
}

public class DebugLog {
    
    /**
    Print log for class name | 打印 所在类名的 log (eg. atLine:__LINE__)
    */
    class func print(description: String = "", number: AnyObject?, atLine: AnyObject, classDotSelf: AnyClass) {

        if DebugConfig().showLog {
            
            if DebugConfig().classNameCompare {
                
                // Filter the class
                if NSStringFromClass(classDotSelf) == DebugConfig().className {
                    
                    self.log(description: description, number: number as? NSNumber, atLine: atLine as NSNumber, classDotSelf: classDotSelf)
                
                }
 
            } else {
                
                self.log(description: description, number: number as? NSNumber, atLine: atLine as NSNumber, classDotSelf: classDotSelf)
            }
            
        }
    }
    
    private class func log(description: String = "", number: NSNumber?, atLine: NSNumber, classDotSelf: AnyClass) {
        var className = NSStringFromClass(classDotSelf)
        
        if number != nil {
            NSLog("\nDebugLog: \n| Class: %@ (\(atLine))\n| Log: \(description) - \(number!) \n ", className)
        } else {
           NSLog("\nDebugLog: \n| Class: %@ (\(atLine))\n| Log: \(description) \n ", className)
        }
        
    }
    
}
