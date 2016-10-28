//
//  KVIAlertMessageContainer.swift
//  KVIAlertMessageExample
//
//  Created by Vasyl Khmil on 10/23/16.
//  Copyright © 2016 Vasyl Khmil. All rights reserved.
//

import Foundation

protocol KVIAlertMessageContainer {
    
    var isVisible: Bool { get }
    
    func setupIfNeed()
    
    func show(presenter: KVIAlertMessagePresenter)
    
    func hide()
}
