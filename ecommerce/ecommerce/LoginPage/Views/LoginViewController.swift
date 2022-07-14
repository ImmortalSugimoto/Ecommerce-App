//
//  ViewController.swift
//  ecommerce
//
//  Created by admin on 6/27/22.
//

import UIKit
import CoreData
import KeychainSwift
class LoginViewController: UIViewController, UITextFieldDelegate{
    //sign in errors in red text below textfield
    @IBOutlet weak var userDNE: UILabel!
    @IBOutlet weak var passwordIncorrect: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    //textfield error logic
   
    @IBAction func accountButton(_ sender: Any) {
    }
    
    @IBAction func rememberSwitch(_ sender: Any) {
        
    }
    
    @IBOutlet weak var rememberMeYa: UISwitch!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func allFieldsFilledOut() -> Bool {
        if(userNameTextField.text != "" && passwordTextField.text != ""){
            return true
        }else{
            return false
        }
    }
    
    func fetchIt(username : NSString, emails : NSString){
        let context = (UIApplication.shared.delegate as?
                       AppDelegate)?.persistentContainer.viewContext
          let request = Account.fetchRequest() as NSFetchRequest<Account>
          var account = NSEntityDescription.insertNewObject(forEntityName: "Account", into: context!) as! Account
        account.username = username as String
        account.email = emails as String
        print(username)
    }
    override func viewDidLoad() {
    super.viewDidLoad()
    passwordTextField.delegate = self
    userNameTextField.delegate = self
     
    super.viewDidLoad()
    guard let topString = keychain.get("user") else {return}
    navigationItem.prompt = NSLocalizedString(topString, comment: "")
     
       
        
    RememberSwitch()
       
            }
            
        
        
        
    func RememberSwitch(){
        let account = NSEntityDescription.insertNewObject(forEntityName: "Account", into: context) as! Account
        rememberMeYa.isOn = false
        if (rememberMeYa.isOn == true) {
            userNameTextField.text = account.username
            passwordTextField.text = keychain.get("password")
            do{
            
            try? self.context.save()
            }
            catch{
                rememberMeYa.isOn = false
                print("error")
                
            }
        }
       
      
        
             }
    
        @objc func handleTap(sender: UITapGestureRecognizer) {
           
               print("false")
                passStack.isHidden = false
                
            
          }
    
    //@IBOutlet weak var mainStack: UIStackView!
    
    @IBOutlet weak var userStack: UIStackView!
    @IBOutlet weak var passStack: UIStackView!
    @IBOutlet var gestureRec: UITapGestureRecognizer!
    
    @IBOutlet var ViewTap: UIView!
    
    //func
    

  /*  //sign in errors in red text below textfield
    @IBOutlet weak var userDNE: UILabel!
    @IBOutlet weak var passwordIncorrect: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    //textfield error logic
   */
            
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        switch textField{
        case userNameTextField:
            if(userNameTextField.text == ""){
                userDNE.isHidden = false
            }else
            {
                userDNE.isHidden = true
            }
      
        case passwordTextField:
            if(passwordTextField.text != ""){
                
                passwordIncorrect.isHidden = true
            }else
            {
                passwordIncorrect.isHidden = false
            }
      
            
        default:
            break
        }
    }
    func loginCheck(){
        
    }
    
    @IBOutlet weak var loginButtonActive: UIButton!
    

    @IBAction func NewAccount(_ sender: Any) {
    }
    @IBAction func enterGuest(_ sender: Any) {
    }
    @IBAction func loginButton(_ sender: Any) {
        if userDNE.isHidden == true &&
            passwordIncorrect.isHidden == true &&
            passwordTextField.text != nil{
            
            loginButtonActive.isEnabled = true
            core.addReg(username: account.username as NSString?, email: account.email as NSString?)
            account.username = userNameTextField.text
           
        }
        else{
            loginButtonActive.isEnabled = false
            
        }
    
    }
    @IBAction func settingsPhone(_ sender: Any) {
        if let url = URL.init(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
