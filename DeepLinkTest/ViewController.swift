//
//  ViewController.swift
//  DeepLinkTest
//
//  Created by Nguyen, Michael on 3/10/23.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var messageLabel: UILabel!
    var message: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        if messageLabel != nil {
            messageLabel.text = message
        }
    }


}

