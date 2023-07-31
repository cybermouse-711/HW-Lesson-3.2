//
//  AddMemberViewController.swift
//  HW Lesson 3.2
//
//  Created by Елизавета Медведева on 30.07.2023.
//

import UIKit

class AddMemberViewController: UIViewController {

    @IBOutlet var idTextField: UITextField!
    @IBOutlet var memberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.gray

    }


}
