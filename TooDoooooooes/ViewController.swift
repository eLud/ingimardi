//
//  ViewController.swift
//  TooDoooooooes
//
//  Created by Ludovic Ollagnier on 11/10/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonToHide: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet weak var isPersoSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func save(_ sender: UIButton) {

    }

    @IBAction func toggleVisibility(_ sender: UIButton) {

        UIView.animate(withDuration: 4) {
        self.buttonToHide.isHidden = !self.buttonToHide.isHidden
            sender.backgroundColor = UIColor.red
        }
    }
}

