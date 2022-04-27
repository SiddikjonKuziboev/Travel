//
//  LoginVC.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 4/20/22.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var phoneTF: UITextField!
    
    @IBOutlet var phoneTFConViews: [UIView]!{
        didSet {
            for i in phoneTFConViews {
                i.layer.borderColor = UIColor.gray.cgColor
                i.layer.cornerRadius = 10
                i.layer.borderWidth = 1
            }
        }
    }
    
    @IBOutlet weak var loginBtn: UIButton!{
        didSet {
            loginBtn.setTitle("Login", for: .normal)
        }
    }
    
    var phoneNumber: String = "+998"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneTF.delegate = self
        passwordTF.delegate = self
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        let vc = RegisterVC(nibName: "RegisterVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func registerBtnPressed(_ sender: Any) {
        let vc = RegisterVC(nibName: "RegisterVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        let userData = Cache.getUserData()
        if var userData = userData {
            if  phoneNumber.replacingOccurrences(of: " ", with: "") == userData.phoneNumber && userData.password == passwordTF.text! {
             userData.token = UUID().uuidString
                Cache.saveUserData(data: userData)
                UIWindow.goToMainTabbar()
            }else {
                Alert.showAlert(state: .error, duration: 4, message: "Check phone number or password incorrect")

            }
        }else {
            Alert.showAlert(state: .error, duration: 4, message: "User not found or password incorrect")
        }
    }
    
}

//MARK: PhoneTF
extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if phoneTF.text?.count == 17 && textField == phoneTF {
            phoneTF.resignFirstResponder()
            passwordTF.becomeFirstResponder()
            }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if phoneTF == textField {
            phoneTF.text = phoneNumber

        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason){
        if phoneTF == textField {
            phoneNumber = phoneTF.text!
        }
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == phoneTF {
            phoneTF.resignFirstResponder()
            passwordTF.becomeFirstResponder()
        }else {
            passwordTF.resignFirstResponder()
        }
        return true
    
    }
    
}
