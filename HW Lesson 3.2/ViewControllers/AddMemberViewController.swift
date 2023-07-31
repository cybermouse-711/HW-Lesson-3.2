//
//  AddMemberViewController.swift
//  HW Lesson 3.2
//
//  Created by Елизавета Медведева on 30.07.2023.
//

import UIKit

// MARK: - UIViewController
class AddMemberViewController: UIViewController {

    // MARK: - @IBOutlet
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var memberTextField: UITextField!
    
    // MARK: - Delegate
    var delegate: AddMemberViewControllerDelegate?
    
    // MARK: - Override metods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.gray
    }
    
    // MARK: - @IBOutlet
    @IBAction func saveButton(_ sender: Any) {
        let newCrew = Crew(
            crew: idTextField.text ?? "not ID",
            role: memberTextField.text ?? "not Role"
        )
        delegate?.getCrew(newCrew)
        dismiss(animated: true)
    }
    
}
