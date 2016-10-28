//
//  KVIAlertMessageSuccessContentView.swift
//  KVIAlertMessageExample
//
//  Created by Vasyl Khmil on 10/19/16.
//  Copyright © 2016 Vasyl Khmil. All rights reserved.
//

import UIKit

class KVIAlertMessageSuccessContentView: KVIAlertMessageDefaultContent {
    
    override init() {
        super.init()
        
        self.backgroundColor = UIColor(red: 29.0/255, green: 159.0/255, blue: 132.0/255, alpha: 0.7)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
