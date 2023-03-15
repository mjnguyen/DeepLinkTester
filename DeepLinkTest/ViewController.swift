//
//  ViewController.swift
//  DeepLinkTest
//
//  Created by Nguyen, Michael on 3/10/23.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var messageLabel: UILabel!
    private var _message: String?
    var message: String? {
        set {
            _message = newValue
            messageLabel?.text = newValue
        }
        get {
            return _message
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        messageLabel.text = message
    }

    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)

        messageLabel?.text = message

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        print("message label is : ", messageLabel?.text ?? "-")
    }

}

