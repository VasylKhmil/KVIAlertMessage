//
//  KVIAlertMessage.swift
//  eFORA
//
//  Created by Vasyl Khmil on 5/12/16.
//  Copyright © 2016 Vasyl Khmil. All rights reserved.
//

import UIKit

class KVIAlertMessage {
    
    //MARK: Singleton
    
    static var shared = KVIAlertMessage()
    
    //MARK: Properties(Public)
    
    var presentersFactory: KVIPresentersFactory?
    
    var containerView: KVIAlertMessageContainer = KVIAlertMessageDefaultContainerView()
    
    var isShowing: Bool {
        return self.containerView.isVisible
    }
    
    //MARK: Properties(Private)
    
    fileprivate let defaultPresentersFactory = KVIDefaultPresentersFactory()
}

//MARK: Displaying

extension KVIAlertMessage {
    
    func show(
        title       : String                = "",
        subtitle    : String                = "",
        image       : UIImage?              = nil,
        type        : KVIAlertMessageType   = .message) {
        
        guard let presenter = self.presenter(for: type) else {
            return
        }
        
        self.containerView.setupIfNeed()
        
        presenter.content.title       = title
        presenter.content.subtitle    = subtitle
        presenter.content.image       = image
        presenter.finishAction        = self.containerView.hide

        self.containerView.show(presenter: presenter)
    }
    
    func hide() {
        
        self.containerView.hide()
    }
    
    private func presenter(for type: KVIAlertMessageType) -> KVIAlertMessagePresenter? {
        
        return self.presentersFactory?.presenter(for: type) ?? self.defaultPresentersFactory.presenter(for: type)
    }
}
