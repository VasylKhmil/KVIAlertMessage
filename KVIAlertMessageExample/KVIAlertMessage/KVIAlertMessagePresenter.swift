//
//  KVIAlertMessagePresenter.swift
//  eFORA
//
//  Created by Vasyl Khmil on 5/12/16.
//  Copyright © 2016 Vasyl Khmil. All rights reserved.
//

import UIKit

protocol KVIAlertMessagePresenter: class {
    
    var content: KVIAlertMessageContent { get }
    
    var finishAction: (() -> Void)? { get set }
    
    func present(in view: UIView)
    
    func dismiss(with finishAction: (() -> Void)?)
}

extension KVIAlertMessagePresenter where Self: KVIAlertMessageContent {
    
    var content: KVIAlertMessageContent {
        return self
    }
    
    func show() { }
    
    func hide() { }
}
