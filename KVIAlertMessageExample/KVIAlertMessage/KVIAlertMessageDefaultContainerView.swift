//
//  KVIAlertMessageDefaultContainerView.swift
//  KVIAlertMessageExample
//
//  Created by Vasyl Khmil on 10/19/16.
//  Copyright © 2016 Vasyl Khmil. All rights reserved.
//

import UIKit

class KVIAlertMessageDefaultContainerView: UIView, KVIAlertMessageContainer {

    var isVisible: Bool {
        return self.currentPresenter != nil
    }
    
    fileprivate var currentPresenter: KVIAlertMessagePresenter? {
        willSet { self.currentPresenter?.dismiss(with: nil) }
        didSet  { self.currentPresenter?.present(in: self) }
    }
}

//MARK: Setup

extension KVIAlertMessageDefaultContainerView {
 
    private var isSetupped: Bool {
        return self.superview != nil
    }
    
    func setupIfNeed() {
        
        if !self.isSetupped {
            self.setup()
        }
    }
    
    private func setup() {
        
        self.isHidden = true
        
        self.backgroundColor = UIColor.clear
        
        self.addToGlobalWindow()
    }
    
    private func addToGlobalWindow() {
        
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        
        self.add(to: window)
    }
    
    private func add(to view: UIView) {
        
        view.addSubview(self)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let bindings = ["view": self]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options:[], metrics:nil, views: bindings))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]",  options:[], metrics:nil, views: bindings))
    }
}

//MARK: Displaying

extension KVIAlertMessageDefaultContainerView {
    
    func show(presenter: KVIAlertMessagePresenter) {
        
        self.isHidden = false
        
        self.currentPresenter = presenter
    }
    
    func hide() {
        self.currentPresenter = nil
        self.isHidden = true
    }
}
