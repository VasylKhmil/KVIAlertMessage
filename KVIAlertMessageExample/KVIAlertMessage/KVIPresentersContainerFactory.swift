//
//  KVIPresentersContainerFactory.swift
//  KVIAlertMessageExample
//
//  Created by Vasyl Khmil on 10/20/16.
//  Copyright © 2016 Vasyl Khmil. All rights reserved.
//

import Foundation

struct KVIPresentersContainerFactory: KVIPresentersFactory {
    
    var presenters: [String : KVIAlertMessagePresenter] = [:]
    
    func presenter(for type: KVIAlertMessageType) -> KVIAlertMessagePresenter? {
        
        return self.presenters[type.id]
    }
}
