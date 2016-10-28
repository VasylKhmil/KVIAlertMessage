//
//  KVIAlertMessageType.swift
//  eFORA
//
//  Created by Vasyl Khmil on 5/12/16.
//  Copyright © 2016 Vasyl Khmil. All rights reserved.
//

import Foundation

enum KVIAlertMessageType {
    case error
    case message
    case success
    case custom(id: String)
    
    var id: String {
        
        switch self {
        case .error     : return "default.error"
        case .message   : return "default.message"
        case .success   : return "default.success"
            
        case let .custom(id): return id
        }
    }
}
