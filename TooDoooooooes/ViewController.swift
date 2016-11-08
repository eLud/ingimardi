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
    @IBOutlet weak var taskImageView: UIImageView!

    let picker = UIDatePicker()
    lazy var dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "dd/MM/yyyy"

        picker.addTarget(self, action: #selector(datePickerUpdated), for: .valueChanged)
        picker.datePickerMode = .date
        picker.minimumDate = Date()

        dateTextField.inputView = picker
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func datePickerUpdated() {
        dateTextField.text = dateFormatter.string(from: picker.date)
    }

    @IBAction func save(_ sender: UIButton) {

        guard let name = nameTextField.text else { return }
        guard let desc = descriptionTextView.text else { return }

        let segmentIndex = prioritySegmentedControl.selectedSegmentIndex
        let priority = Task.Priority(rawValue: segmentIndex) ?? Task.Priority.normal
        let type: Task.TaskType = isPersoSwitch.isOn ? .personal : .professional

        let task = Task(name: name, description: desc, dueDate: picker.date, priority: priority, type: type)
        TaskManager.instance.add(task)
    }

    @IBAction func toggleVisibility(_ sender: UIButton) {


        let photoController = UIImagePickerController()

        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            photoController.sourceType = .camera
        } else if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            photoController.sourceType = .photoLibrary
        } else {
            fatalError()
        }

        photoController.delegate = self
        present(photoController, animated: true, completion: nil)

//        UIView.animate(withDuration: 4) {
//        self.buttonToHide.isHidden = !self.buttonToHide.isHidden
//            sender.backgroundColor = UIColor.red
//        }
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            taskImageView.image = image
        }
        dismiss(animated: true, completion: nil)
        print(info)
    }
}

