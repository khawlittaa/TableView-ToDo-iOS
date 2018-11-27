//
//  Taskmodel.swift
//  MyToDo
//
//  Created by Admin on 11/26/18.
//  Copyright © 2018 khawla hafsia. All rights reserved.
//

import Foundation


class Taskmodel
{
    private var _task : String!
    private var _taskDate : Date!
    private var _time: Int!
    
    var TaskDate :Date
    {
        return _taskDate
    }
    
    var Task :String
    {
        return _task
    }
    var Time :Int
    {
        return _time
    }
 
    
    init(task:String , date : Date , time:Int )
    {
       
        _task = task
        _taskDate = date
        _time = time
        
    }
    
}

