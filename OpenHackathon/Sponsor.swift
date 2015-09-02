//
//  Sponsor.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-09-02.
//  Copyright (c) 2015 Saad Ahmed. All rights reserved.
//

import Foundation
import UIKit

class Sponsor{
    
    var name: String!
    var imageLogo: UIImage!
    var info: String!
    var website: String!
    
    required init(name: String, imageHandle: String, info: String, website: String){
        
        self.name = name
        self.imageLogo = UIImage(named: imageHandle)
        self.info = info
        self.website = website
    }
}