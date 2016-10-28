//
//  KVIAlertMessageDefaultContent.swift
//  eFORA
//
//  Created by Vasyl Khmil on 5/12/16.
//  Copyright © 2016 Vasyl Khmil. All rights reserved.
//

import UIKit

class KVIAlertMessageDefaultContent: UIView, KVIAlertMessageContent {
    
    //MARK: Outlets
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var messageLabel: UILabel!
    
    //MARK: Properties
    
    var enterType: KVIAlertMessageType = .message
    
    var title: String? {
        set { self.self.titleLabel.text = newValue }
        get { return self.titleLabel.text }
    }
    
    var subtitle: String? {
        set { self.messageLabel.text = newValue }
        get { return self.messageLabel.text }
    }
    
    init() {
        super.init(frame: CGRect.zero)
        
        self.setupContent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setupContent()
    }
    
    
    private func setupContent() {
        
        let contentNibName = "KVIAlertMessageContentView"
        
        if let contentView = Bundle.main.loadNibNamed(contentNibName, owner: self, options: nil)?.first as? UIView {
            
            contentView.backgroundColor = UIColor.clear
            
            self.add(fullsizedSubview: contentView)
        }
    }
    
    func show() {
        self.alpha = 1
        
        self.transform = CGAffineTransform.identity
    }
    
    func hide() {
        
        self.alpha = 0
        
        self.transform = CGAffineTransform.identity.translatedBy(x: 0, y: -self.bounds.height)
    }
}


extension KVIAlertMessageDefaultContent {
    
    static func contentView(for messageType: KVIAlertMessageType) -> KVIAlertMessageDefaultContent? {
        
        switch messageType {
        case .error     : return KVIAlertMessageErrorContentView()
        case .message   : return KVIAlertMessageMessageContentView()
        case .success   : return KVIAlertMessageSuccessContentView()
        case .custom    : return nil
        }
    }
}
