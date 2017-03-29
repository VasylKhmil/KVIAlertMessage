//
//  KVIAlertMessageContentViewPresenter.swift
//  KVIAlertMessageExample
//
//  Created by Vasyl Khmil on 10/21/16.
//  Copyright © 2016 Vasyl Khmil. All rights reserved.
//

import UIKit

class TapResponder {
    let action  : () -> Void
    
    init(view: UIView, action: @escaping () -> Void) {
        self.action = action
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(TapResponder.tapped))
        view.addGestureRecognizer(gesture)
    }
    
    @objc private func tapped() {
        self.action()
    }
}

class KVIAlertMessageContentViewPresenter<T>: KVIAlertMessagePresenter where T: UIView, T: KVIAlertMessageContent {
    
    var content: KVIAlertMessageContent {
        return self.viewContainer
    }
    
    private let viewContainer: T
    private var tapResponder: TapResponder?
    
    var finishAction: (() -> Void)?
    
    fileprivate var timer: Timer?
    
    func present(in view: UIView) {
        
        self.tapResponder = TapResponder(view: viewContainer, action: {
            self.dismiss()
        })
        
        view.add(fullsizedSubview: self.viewContainer)
    
        self.viewContainer.layoutIfNeeded()
        
        self.viewContainer.hide()
    
        UIView.animate(withDuration: 0.3, animations: self.viewContainer.show)
        
        self.setupDismissTimer()
    }
    
    init(viewContainer: T) {
        self.viewContainer = viewContainer
    }
    
    private func dismiss() {
        self.dismiss(with: self.finishAction)
    }
    
    func dismiss(with finishAction: (() -> Void)?) {
        
        self.timer?.invalidate()
        
        UIView.animate(withDuration: 0.3,
                       animations: self.viewContainer.hide,
                       
                       completion: {
                        _ in
                        
                        self.viewContainer.removeFromSuperview()
                        
                        finishAction?()
                        
                        self.viewContainer.show()
        })
    }
    
    private func setupDismissTimer() {
        
        self.timer = Timer(fire: Date(), interval: 3, repeats: false) {
            [unowned self](_) in
            
            self.dismiss()
        }
    }
}
