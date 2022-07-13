//
//  RegisterViewController.swift
//  ecommerce
//
//  Created by xcode on 6/29/22.
//

import UIKit
import KeychainSwift
import CoreData

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
    func registerButtonAvailable(){
        if passwordMatchSuccess.isHidden == false &&
            availableUser.isHidden == false &&
            invalidEmail.isHidden == true {
            regButton.isHidden = false
        }
        else {
            regButton.isHidden = true
        }
    }
    @IBOutlet weak var passwordMatch1: UILabel!
    @IBOutlet weak var availableUser: UILabel!
    @IBOutlet weak var invalidEmail: UILabel!
    @IBOutlet weak var userTaken: UILabel!
    @IBOutlet weak var passwordMatch2: UILabel!
    @IBOutlet weak var passwordMatchSuccess: UILabel!
    @IBOutlet weak var regButton: UIButton!
    
   
    @IBAction func otp(_ sender: Any) {
        let context = (UIApplication.shared.delegate as?
                       AppDelegate)?.persistentContainer.viewContext
        let account = NSEntityDescription.insertNewObject(forEntityName: "Account", into: context!) as! Account
        let keychain = KeychainSwift()
        let username = userTextfield.text
        let password = pwTextField.text
        let passwordCheck = reEnterPassText.text
       
        if username == account.username{
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
        if(emails.text?.range(of: #".+\@.+\..+"#, options: .regularExpression) != nil){
           invalidEmail.isHidden = true
        }else{
            invalidEmail.isHidden = false
        }
        if(invalidEmail.isHidden == true &&
           passwordMatchSuccess.isHidden == false &&
           availableUser.isHidden == false){
            //random 4 digit number to send as OTP
            let randomInt = Int.random(in: 1000..<9999)
            UNUserNotificationCenter.current().getNotificationSettings{ notify in
                switch notify.authorizationStatus{
                case .notDetermined:
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]){
                        granted , err in
                        if let error = err{
                            print("error in permission", error)
                        }
                        self.generateNotification(randomInt)
                        
                    }
                case .authorized:
                    self.generateNotification(randomInt)
                case .denied:
                    print("permission not given")
                default:
                    print("default")
                }
                
            }
            let alert = UIAlertController(title: "OTP", message: "Please provide your One Time Passcode", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: {[weak self] _ in
                guard let field = alert.textFields?.first, let newText = field.text else{
                    return
                }
                let enteredCode = Int(newText)
                //enable sign up button if OTP matches
                if(enteredCode == randomInt){
                    self!.regButton.isEnabled = true
                }else{
                    let alert = UIAlertController(title: "Error", message: "Incorrect One Time Passcode", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Confirm", style: .default))
                    self!.present(alert, animated: true)
                }
            }))
            alert.addTextField(configurationHandler: nil)
            self.present(alert, animated: true)
        }
        
        
        else{
            let defaultAction = UIAlertAction(title: "Ok", style: .default){(action) in}
            let alert = UIAlertController(title: "Error", message: "All Fields must be filled out", preferredStyle: .alert)
            alert.addAction(defaultAction)
            self.present(alert, animated: true)
        }
        registerButtonAvailable()
      
    }
    func generateNotification(_ num : Int){
        let OTP = String(num)
        let content = UNMutableNotificationContent()
        content.title = "Pick and Pay"
        content.subtitle = "Your One Time Passcode"
        content.body = OTP
        let timeInterval = UNTimeIntervalNotificationTrigger(timeInterval: 2.0, repeats: false)
        let request = UNNotificationRequest(identifier: "User_App_Notification", content: content, trigger: timeInterval)
        UNUserNotificationCenter.current().add(request)
    }
    @IBAction func registerButton(_ sender: Any) {
        let username = userTextfield.text
        let email = emails.text
        let context = (UIApplication.shared.delegate as?
                       AppDelegate)?.persistentContainer.viewContext
        let account = NSEntityDescription.insertNewObject(forEntityName: "Account", into: context!) as! Account
        core.addReg(username: account.username as? NSString, email: account.email as? NSString)
        account.username = username
        account.email = email
        print(account.username)
        print(account.email)
        print(username)
        print(email)
    }
    
    @IBOutlet weak var reEnterPassText: UITextField!
    @IBOutlet weak var emails: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var userTextfield: UITextField!
   @IBOutlet weak var phontText: UITextField!
}
