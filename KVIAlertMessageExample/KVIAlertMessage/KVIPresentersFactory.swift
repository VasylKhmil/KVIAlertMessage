//
//  KVIPresentersFactory.swift
//  KVIAlertMessageExample
//
//  Created by Vasyl Khmil on 10/20/16.
//  Copyright © 2016 Vasyl Khmil. All rights reserved.
//

import Foundation

protocol KVIPresentersFactory {
    
    func presenter(for type: KVIAlertMessageType) -> KVIAlertMessagePresenter?
}
