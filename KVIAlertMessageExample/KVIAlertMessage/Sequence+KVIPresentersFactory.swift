//
//  Sequence+KVIPresentersFactory.swift
//  KVIAlertMessageExample
//
//  Created by Vasyl Khmil on 10/20/16.
//  Copyright © 2016 Vasyl Khmil. All rights reserved.
//

import Foundation

extension Sequence where Iterator.Element == (key: String, value: KVIAlertMessagePresenter) {
    
    func presentersFactory() -> KVIPresentersFactory {
        
        let presenters = self as? [String : KVIAlertMessagePresenter] ?? [:]
        
        return KVIPresentersContainerFactory(presenters: presenters)
    }
}
