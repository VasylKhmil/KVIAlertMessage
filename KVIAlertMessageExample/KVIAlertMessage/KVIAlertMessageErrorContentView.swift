//
//  KVIAlertMessageErrorContentView.swift
//  KVIAlertMessageExample
//
//  Created by Vasyl Khmil on 10/19/16.
//  Copyright © 2016 Vasyl Khmil. All rights reserved.
//

import UIKit

class KVIAlertMessageErrorContentView: KVIAlertMessageDefaultContent {
 
    override init() {
        super.init()
        
        self.backgroundColor = UIColor(red: 140.0/255, green: 36.0/255, blue: 58.0/255, alpha: 0.7)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
