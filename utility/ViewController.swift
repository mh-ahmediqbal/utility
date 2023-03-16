//
//  ViewController.swift
//  utility
//
//  Created by Ahmed Iqbal on 5/28/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnOpenAlert: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnOpenAlertPressed(_ sender: UIButton) {
        self.showGeneralAlert(title: Constants.AppName, description: Constants.PlaceholderDescription, alertType: .Info, iconName: "AppIcon", btn2ActionHandler:  {
            print("perform your own action here")
        })
    }
    
}

