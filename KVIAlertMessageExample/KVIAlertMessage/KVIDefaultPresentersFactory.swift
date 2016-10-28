//
//  KVIDefaultPresentersFactory.swift
//  KVIAlertMessageExample
//
//  Created by Vasyl Khmil on 10/20/16.
//  Copyright © 2016 Vasyl Khmil. All rights reserved.
//

import UIKit

struct KVIDefaultPresentersFactory: KVIPresentersFactory {
    
    func presenter(for type: KVIAlertMessageType) -> KVIAlertMessagePresenter? {
        
        guard let contentContainer = KVIAlertMessageDefaultContent.contentView(for: type) else {
            return nil
        }
        
        return KVIAlertMessageContentViewPresenter(viewContainer: contentContainer)
    }
}
