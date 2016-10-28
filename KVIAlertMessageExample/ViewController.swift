//
//  ViewController.swift
//  KVIAlertMessageExample
//
//  Created by Vasyl Khmil on 10/18/16.
//  Copyright © 2016 Vasyl Khmil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private struct Constants {
        static let CustomErrorPresenterType = "custom_error_pesenter"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        KVIAlertMessage.shared.presentersFactory = [Constants.CustomErrorPresenterType : CustomBigErrorPresenter.instantiate()].presentersFactory()
    }
    
    @IBAction func showDefaultAlertMessagePressed() {
        KVIAlertMessage.shared.show(title: "Default message title", subtitle: "Default message subtitle", type: .message)
    }
    
    @IBAction func showDefaultAlertErrorPressed() {
        KVIAlertMessage.shared.show(title: "Default error title", subtitle: "Default error subtitle", type: .error)
    }
    
    @IBAction func showDefaultAlertSuccessPressed() {
        KVIAlertMessage.shared.show(title: "Default success title", subtitle: "Default error subtitle", type: .success)
    }
    
    @IBAction func showDefaultAlertWithNoSubtitle() {
        KVIAlertMessage.shared.show(title: "Default message title", type: .message)
    }
    
    @IBAction func showCustomBigErrorPresenterPressed() {
        KVIAlertMessage.shared.show(title: "Default message title", type: .custom(id: Constants.CustomErrorPresenterType))
    }
}

