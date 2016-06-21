//
//  College.swift
//  colleges
//
//  Created by Forrest Filler on 6/20/16.
//  Copyright © 2016 forrestfiller. All rights reserved.
//

import UIKit

class College: NSObject {
    
    var name: String!
    var location: String!
    var type: String!
    var mascot: String!
    var league: String!
    var image: String!
    
    func populate(collegeInfo: Dictionary<String, AnyObject>){
        
        self.name = collegeInfo["name"] as? String
        self.location = collegeInfo["location"] as? String
        self.type = collegeInfo["type"] as? String
        self.mascot = collegeInfo["mascot"] as? String
        self.league = collegeInfo["league"] as? String
        self.image = collegeInfo["image"] as? String
        
    }

}
