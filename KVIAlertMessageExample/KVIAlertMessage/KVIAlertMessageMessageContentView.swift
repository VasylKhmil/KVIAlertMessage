//
//  KVIAlertMessageMessageContentView.swift
//  KVIAlertMessageExample
//
//  Created by Vasyl Khmil on 10/19/16.
//  Copyright © 2016 Vasyl Khmil. All rights reserved.
//

import UIKit

class KVIAlertMessageMessageContentView: KVIAlertMessageDefaultContent {
    
    override init() {
        super.init()
        
        self.backgroundColor = UIColor(red: 44.0/255, green: 129.0/255, blue: 190.0/255, alpha: 0.7)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
