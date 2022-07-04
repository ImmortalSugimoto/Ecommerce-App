//
//  RegisterViewController.swift
//  ecommerce
//
//  Created by xcode on 6/29/22.
//

import UIKit
import KeychainSwift
import KeychainAccess

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        passwordMatch1.isHidden = true
        passwordMatch2.isHidden = true
        userTaken.isHidden = true
        invalidEmail.isHidden = true
        availableUser.isHidden = true
        passwordMatchSuccess.isHidden = true
        regButton.isHidden = true
    }
    
    @IBOutlet weak var passwordMatch1: UILabel!
    @IBOutlet weak var availableUser: UILabel!
    @IBOutlet weak var invalidEmail: UILabel!
    @IBOutlet weak var userTaken: UILabel!
    @IBOutlet weak var passwordMatch2: UILabel!
    @IBOutlet weak var passwordMatchSuccess: UILabel!
    @IBOutlet weak var regButton: UIButton!
    
  
    @IBAction func otp(_ sender: Any) {
        let keychain = KeychainSwift()
        let user = userTextfield.text
        let password = pwTextField.text
        let passwordCheck = reEnterPassText.text
        
        if user == keychain.get("user"){
            userTaken.isHidden = false
            availableUser.isHidden = true
        }else
        {
            availableUser.isHidden = false
            userTaken.isHidden = true
            
        }
        if password == passwordCheck {
            keychain.set(password!, forKey: "password")
            passwordMatch1.isHidden = true
            passwordMatch2.isHidden = true
            passwordMatchSuccess.isHidden = false
            }
        else {
            passwordMatch2.isHidden = false
            passwordMatch1.isHidden = false
            passwordMatchSuccess.isHidden = true
        }
        regButton.isHidden = false
    }
    @IBAction func registerButton(_ sender: Any) {
        let keychain = KeychainSwift()
        let user = userTextfield.text
        keychain.set(user!, forKey: "user")
        let email = emails.text
        keychain.set(email!, forKey: "emails")
        let phone = phontText.text
        keychain.set(phone!, forKey: "phone")
        let alert = UIAlertController(title: "Sign Up success", message: "Please return to the sign in screen to continue.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        return
    }
    
    @IBOutlet weak var reEnterPassText: UITextField!
    @IBOutlet weak var emails: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var userTextfield: UITextField!
   @IBOutlet weak var phontText: UITextField!
}
