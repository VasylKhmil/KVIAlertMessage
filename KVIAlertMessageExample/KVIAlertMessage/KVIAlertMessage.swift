//
//  KVIAlertMessage.swift
//  eFORA
//
//  Created by Vasyl Khmil on 5/12/16.
//  Copyright © 2016 Vasyl Khmil. All rights reserved.
//

import UIKit

class KVIAlertMessage {
    
    /*
     - Singleton instance.
     - Must be used for correct behaviour of messages presentation.
    */
    private(set) static var shared = KVIAlertMessage()
    
    /*
     - Is used for providing factory for custom presentors(KVIAlertMessagePresenter).
     - If custom factory is not provided - the default factory(self.defaultPresentersFactory) will be used.
     - If custom factory do not provide presentor for some type(KVIAlertMessageType) - the presentor from default factory(self.defaultPresentersFactory) will be provided.
    */
    var presentersFactory: KVIPresentersFactory?
    
    /*
     - Is used for providing container where messages will be presented.
     - If container view is not provided - the default(KVIAlertMessageDefaultContainerView) will be used.
    */
    var containerView: KVIAlertMessageContainer = KVIAlertMessageDefaultContainerView()
    
    /*
     - Determinate if any message is showing.
     */
    var isShowing: Bool {
        return self.containerView.isVisible
    }
    
    /*
     - Default implementation of KVIPresentersFactory.
     - Is used if custom factory(self.presentersFactory) property is not provided.
     - Is used if custom factory(self.presentersFactory) do not provide presenter(KVIAlertMessagePresenter) for some type(KVIAlertMessageType).
    */
    fileprivate let defaultPresentersFactory = KVIDefaultPresentersFactory()
}

//MARK: Displaying
extension KVIAlertMessage {
    
    /*
     - Method to provide info for new message and display it immediately.
     
     - Parameters:
        + title     : the title of message.
        + subtitle  : subtitle of message(longer description of message).
        + image     : image of message provided by class UIImage.
        + type      : type of message provided by enum KVIAlertMessageType that respond for theme of message presentation.
    */
    func show(
        title       : String                = "",
        subtitle    : String                = "",
        image       : UIImage?              = nil,
        type        : KVIAlertMessageType   = .message) {
        
        guard let presenter = self.presenter(for: type) else { return }
        
        self.containerView.setupIfNeed()
        
        presenter.content.title       = title
        presenter.content.subtitle    = subtitle
        presenter.content.image       = image
        presenter.finishAction        = self.containerView.hide

        self.containerView.show(presenter: presenter)
    }
    
    /*
     - Method to hide message that is presented.
     - Method do nothing if not message is presented.
    */
    func hide() {
        self.containerView.hide()
    }
    
    /*
     - Method to provide preseter(KVIAlertMessagePresenter) for type(KVIAlertMessageType).
     
     - Parameters:
        + type: the type of message for which theme presenter will be provided.
     
     - Return:
        + presenter that is responsible for presenting message with specific theme.
    */
    private func presenter(for type: KVIAlertMessageType) -> KVIAlertMessagePresenter? {
        return self.presentersFactory?.presenter(for: type) ?? self.defaultPresentersFactory.presenter(for: type)
    }
}
