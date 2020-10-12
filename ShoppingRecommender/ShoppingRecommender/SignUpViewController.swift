//
//  SignUpViewController.swift
//  ShoppingRecommender
//
//  Created by 이진호 on 2020/10/09.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var currentSex: String = "남"
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var sexSegment: UISegmentedControl!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var birthDatePicker: UIDatePicker!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!

    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker) {
        self.birthLabel.text = getBirthString()
    }
    
    @IBAction func idDidChange(_ sender: UITextField) {
        checkStatus()
    }
    
    @IBAction func passwordDidChange(_ sender: UITextField) {
        checkStatus()
    }
    
    @IBAction func checkPasswordDidChange(_ sender: UITextField) {
        checkStatus()
    }
    
    @IBAction func pushSignUpButton(_ sender: UIButton) {
        UserInformation.userInfo.id = idTextField.text
        UserInformation.userInfo.password = passwordTextField.text
        UserInformation.userInfo.sex = currentSex
        UserInformation.userInfo.birth = birthLabel.text
        print(UserInformation.userInfo)
    }
    
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        let selectedSegmentedIndex = sender.selectedSegmentIndex
        if selectedSegmentedIndex == 0 {
            currentSex = "남"
        } else {
            currentSex = "여"
        }
    }
    
    func getBirthString() -> String {
        let date: Date = birthDatePicker.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        return dateString
    }
    
    func checkStatus() {
        if idTextField.text != "", passwordTextField.text != "", confirmPasswordTextField.text != "" {
            if passwordTextField.text == confirmPasswordTextField.text {
                signUpButton.isEnabled = true
            } else {
                signUpButton.isEnabled = false
            }
        } else {
            signUpButton.isEnabled = false
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func addGesture() {
        let viewTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapView(_:)))
        self.view.addGestureRecognizer(viewTapGesture)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.idTextField.delegate = self
        self.passwordTextField.delegate = self
        self.confirmPasswordTextField.delegate = self
        self.birthLabel.text = getBirthString()
        self.birthDatePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
        self.sexSegment.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: UIControl.Event.valueChanged)
        addGesture()
        checkStatus()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
