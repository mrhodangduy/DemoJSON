//
//  ViewController.swift
//  JSON
//
//  Created by Paul on 7/18/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var mang = Array<JsonDefine>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getJson()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getJson(){
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
        let task = URLSession.shared.dataTask(with: url!) { (data, respone, error) in
            if error != nil
            {
                print("loi")
            }
            else
            {
                if let content = data {
                    do {
                        let myJson = try JSONSerialization.jsonObject(with: content, options: .mutableContainers) as AnyObject
                        
                        let arrTemp = myJson as! Array<[String: AnyObject]>
                        
//                        print(arrTemp)
                        
                        let count = arrTemp.count - 1
                    
                        
                        
                        print(arrTemp[0]["title"]!)
                       
                        for i in 0...count {
                            
                            let id = arrTemp[i]["id"] as! Int
                            let userId = arrTemp[i]["userId"] as! Int
                            let title = arrTemp[i]["title"] as! String
                            let completed = arrTemp[i]["completed"] as! Int
                            
                            
                           
                            let user = JsonDefine(id: id, userId: userId, title: title, completed: completed)
                            print(user)
                            
                            self.mang.append(user)
                            
                        }
                        print(self.mang)
                        
                        
                    }
                    catch
                    {
                        
                    }
                    
                }
            }
        }
        task.resume()
        
    }


}

