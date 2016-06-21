//
//  ViewController.swift
//  colleges
//
//  Created by Forrest Filler on 6/20/16.
//  Copyright © 2016 forrestfiller. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var collegesTable: UITableView!
    var collegeList = Array<Dictionary<String, AnyObject>>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://colleges-api.herokuapp.com/api/college"
        
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
        
            if let json = response.result.value as? Dictionary<String, AnyObject> {
                
                if let colleges = json["colleges"] as? Array<Dictionary<String, AnyObject>>{
                    print("\(colleges)")
                    
                    for college in colleges {
                        self.collegeList.append(college)
                    }
                    
                    self.collegesTable.reloadData() //refreshes data in the view; NOT a new .GET
                }
            }
        }        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.collegeList.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let college = self.collegeList[indexPath.row] // this is a dictionary
        
        let cellId = "cellId"
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId) {
            cell.textLabel?.text = college["name"] as? String
            cell.detailTextLabel?.text = college["location"] as? String
            return cell
        }
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = college["name"] as? String
        cell.detailTextLabel?.text = college["location"] as? String
        return cell
    }
}

