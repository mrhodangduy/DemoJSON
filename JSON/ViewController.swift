//
//  ViewController.swift
//  JSON
//
//  Created by Paul on 7/18/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

struct JsonDefine {
    var id: Int
    var userId: Int
    var title: String
    var completed: Bool
    
    init(id:Int, userId:Int, title:String, completed: Bool) {
        self.id = id
        self.userId = userId
        self.title = title
        self.completed = completed
    }
}


class ViewController: UIViewController {
    
    
    var mang: Array<JsonDefine> = Array<JsonDefine>()
    var arrTemp:[[String: AnyObject]] = [[String:AnyObject]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(mang)
        print(arrTemp)
//        let user = JsonDefine(id: 1, userId: 1, title: "abcd", completed: true)
//        let user2 = JsonDefine(id: 1, userId: 1, title: "xyz", completed: true)
//
//        mang.append(user)
//        mang.append(user2)

        
        getJson()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {

    }
    
    public func getJson(){
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
        let task = URLSession.shared.dataTask(with: url!) { (data, respone, error) in
            if error != nil
            {
                print("loi")
            }
            else
            {
                if let content = data {
                    var myJson:AnyObject!
                    do {
                        myJson = try JSONSerialization.jsonObject(with: content, options: .mutableContainers) as AnyObject
                        
                    }
                    catch
                    {
                        print("Catch dc loi")
                    }
                    
                    self.arrTemp = myJson as! Array<[String: AnyObject]>
                    let count = self.arrTemp.count - 1
                    
                    for i in 0...count {
                        
                        let id = self.arrTemp[i]["id"] as! Int
                        let userId = self.arrTemp[i]["userId"] as! Int
                        let title = self.arrTemp[i]["title"] as! String
                        let completed = self.arrTemp[i]["completed"] as! Bool
                        
                        let user = JsonDefine(id: id, userId: userId, title: title, completed: completed)
                        self.mang.append(user)
                        
                        print(self.mang)
                    }
                }
            }
        }
        task.resume()
    }
    
}

