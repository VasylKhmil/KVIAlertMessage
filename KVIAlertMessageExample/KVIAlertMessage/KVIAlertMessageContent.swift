//
//  KVIAlertMessageContent.swift
//  KVIAlertMessageExample
//
//  Created by Vasyl Khmil on 10/21/16.
//  Copyright © 2016 Vasyl Khmil. All rights reserved.
//

import UIKit

protocol KVIAlertMessageContent: class {
    
    var image: UIImage? { get set }
    
    var title: String? { get set }
    
    var subtitle: String? { get set }
    
    func show()
    
    func hide()
}


extension KVIAlertMessageContent {
    
    var image: UIImage? {
        get { return nil }
        set {}
    }
    
    var title: String? {
        get { return nil }
        set {}
    }
    
    var subtitle: String? {
        get { return nil }
        set {}
    }
}
