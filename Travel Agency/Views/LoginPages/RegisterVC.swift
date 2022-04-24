//
//  RegisterVC.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 4/21/22.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var surnameTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var confirmPasswordTF: UITextField!
    
    @IBOutlet var conViewsTF: [UIView]!{
        didSet {
            for i in conViewsTF {
                i.layer.borderColor = UIColor.gray.cgColor
                i.layer.cornerRadius = 10
                i.layer.borderWidth = 1
            }
        }
    }
    
    var phoneNumber = "+998"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        phoneTF.delegate = self
        nameTF.delegate  = self
        surnameTF.delegate = self
        passwordTF.delegate = self
        confirmPasswordTF.delegate = self
    }

    func saveUserData() {
        
        if nameTF.text == "" {
            Alert.showAlert(state: .warning, message: "The name is mandatory")
        }else  {
            if passwordTF.text! == "" || confirmPasswordTF.text! == "" {
                Alert.showAlert(state: .warning, message: "The password is mandatory")
            }else {
                if phoneTF.text! == "" || phoneTF.text!.count < 7  {
                    Alert.showAlert(state: .warning, message: "The phone   is mandatory")
                }else {
                    if passwordTF.text!.count <= 5 || confirmPasswordTF.text! != passwordTF.text! {
                        Alert.showAlert(state: .warning, message: "The password be greater than five or not equal")
                    }else {
                        let userData = UserDM(name: nameTF.text!, lastName: surnameTF.text!, phoneNumber: phoneTF.text!.replacingOccurrences(of: " ", with: ""), password: passwordTF.text!)
                        Cache.saveUserData(data: userData)
                        UIWindow.goToMainTabbar()
                    }
                }
            }
        }
        
    }
    
    @IBAction func registerBtnPressed(_ sender: Any) {
        saveUserData()
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

//MARK: PhoneTF
extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if phoneTF.text?.count == 17 && phoneTF == textField {
            phoneTF.resignFirstResponder()
            nameTF.becomeFirstResponder()
            }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == phoneTF {
            phoneTF.text = phoneNumber
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if phoneTF == textField {
            phoneNumber = phoneTF.text!
        }

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case phoneTF:
            phoneNumber = phoneTF.text!
            phoneTF.resignFirstResponder()
            nameTF.becomeFirstResponder()
        case nameTF :
            nameTF.resignFirstResponder()
            surnameTF.becomeFirstResponder()
        case surnameTF :
            surnameTF.resignFirstResponder()
            passwordTF.resignFirstResponder()
        case passwordTF :
            passwordTF.resignFirstResponder()
            confirmPasswordTF.becomeFirstResponder()
        case confirmPasswordTF :
            confirmPasswordTF.resignFirstResponder()
        default:
            print("register tfs")
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == phoneTF {
            guard let text = textField.text else { return false }
            let newString = (text as NSString).replacingCharacters(in: range, with: string)
            textField.text?.formatPhoneNumber(with: "+XXX XX XXX XX XX", phone: newString)
            return false
        }
        return true


    }
    
    
}
