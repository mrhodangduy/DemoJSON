//
//  JsonDefine.swift
//  JSON
//
//  Created by Paul on 7/18/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import Foundation

struct JsonDefine {
    var id: Int
    var userId: Int
    var title: String
    var completed: Int
    
    init(id:Int, userId:Int, title:String, completed: Int) {
        self.id = id
        self.userId = userId
        self.title = title
        self.completed = completed
    }
}
