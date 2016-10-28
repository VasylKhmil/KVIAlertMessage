//
//  CustomBigErrorPresenter.swift
//  KVIAlertMessageExample
//
//  Created by Vasyl Khmil on 10/19/16.
//  Copyright © 2016 Vasyl Khmil. All rights reserved.
//

import UIKit

class CustomBigErrorPresenter: UIView, KVIAlertMessagePresenter, KVIAlertMessageContent {
    
    var finishAction: (() -> Void)?
    
    func present(in view: UIView) {
        
        view.add(fullsizedSubview: self)
    }
    
    func dismiss(with finishAction: (() -> Void)?) {
        
        self.removeFromSuperview()
    }
    
    static func instantiate() -> CustomBigErrorPresenter {
        
        return Bundle.main.loadNibNamed("CustomBigErrorPresenter", owner: nil, options: nil)?.first as? CustomBigErrorPresenter ?? CustomBigErrorPresenter()
    }
    
    @IBAction private func tapped() {
        KVIAlertMessage.shared.hide()
    }
}
