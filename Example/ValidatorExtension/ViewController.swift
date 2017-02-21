//
//  ViewController.swift
//  ValidatorExtension
//
//  Created by rajanshahsa on 02/21/2017.
//  Copyright (c) 2017 rajanshahsa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var swtcOption : UISwitch!
    
    @IBOutlet var txtInput : UITextField!
    @IBOutlet var lblAns : UILabel!
    @IBOutlet var btnSubmit : UIButton!
    var datePicker : UIDatePicker!
    let dateFormatter = DateFormatter()
    
    @IBOutlet weak var txtEmailInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func swcOptionChange(_ sender: Any) {
        view.endEditing(true)
        if swtcOption.isOn {
            txtInput.isHidden = false
            txtEmailInput.isHidden = true
        }
        else {
            txtInput.isHidden = true
            txtEmailInput.isHidden = false
        }
        txtInput.text = ""
        txtEmailInput.text = ""
    }
    
    @IBAction func btnSubmit_Clicked(_ sender: Any) {
        view.endEditing(true)
        if swtcOption.isOn {
            print("Ison")
            guard datePicker != nil else {
                return
            }
            let currentDate = dateFormatter.date(from: dateFormatter.string(from: Date()))
            let selectedDate = dateFormatter.date(from: txtInput.text!)
            let str = currentDate?.getDifferanceFromCurrentTime(serverDate: selectedDate!)
            lblAns.text = str
        }
        else {
            if (txtEmailInput.text?.isValidEmail())! {
                lblAns.text = "Email Id is valid"
            }
            else {
                lblAns.text = "Email Id is not valid"
            }
        }
    }
    
    // Set the Value of DOB picker view's in DOB textFields
    func setupDOBValue(_ sender:UIDatePicker) {
        let DOB = sender.date
        txtInput.text = dateFormatter.string(from: sender.date)
        debugPrint(DOB)
    }
}

extension ViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if swtcOption.isOn {
            datePicker = UIDatePicker()
            datePicker.datePickerMode = UIDatePickerMode.dateAndTime
            datePicker.maximumDate = Date()
            textField.inputView = datePicker
            txtInput.text = dateFormatter.string(from: datePicker.date)
            datePicker.addTarget(self, action: #selector(self.setupDOBValue(_:)), for: .valueChanged)
        }
        else {
            textField.keyboardType = .emailAddress
        }
        
    }
}

