//
//  UIView+AddFullsizedSubview.swift
//  KVIAlertMessageExample
//
//  Created by Vasyl Khmil on 10/19/16.
//  Copyright © 2016 Vasyl Khmil. All rights reserved.
//

import UIKit

extension UIView {
    
    func add(fullsizedSubview subview: UIView) {
        
        self.addSubview(subview)
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        let bindings = ["view": subview]
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options:[], metrics:nil, views: bindings))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options:[], metrics:nil, views: bindings))
    }
}
