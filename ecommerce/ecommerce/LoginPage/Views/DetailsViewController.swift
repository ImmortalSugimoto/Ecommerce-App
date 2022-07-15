//
//  DetailsViewController.swift
//  ecommerce
//
//  Created by xcode on 7/5/22.
//

import UIKit
import KeychainSwift
import CoreData
class DetailsViewController: UIViewController, UITextFieldDelegate {
    var email = ""
    var shippingAddress = ""
    var billingAddress = ""
    var paymentInfo = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let topString = keychain.get("user") else {return}
        navigationItem.prompt = NSLocalizedString(topString, comment: "")
        emailText.delegate = self
        
    }
  // To save the new entity to the persistent store, call
    // save on the context

    @IBOutlet weak var shippingAd: UITextField!
    @IBOutlet weak var shippingCity: UITextField!
    @IBOutlet weak var shippingState: UITextField!
    @IBOutlet weak var shippingZip: UITextField!
   
 
    
    @IBAction func storage(_ sender: Any) {
    }
    @IBOutlet weak var billingAd: UITextField!
    @IBOutlet weak var billingCity: UITextField!
    @IBOutlet weak var billingState: UITextField!
    @IBOutlet weak var billingZip: UITextField!
    
   
    @IBOutlet weak var ccNumber: UITextField!
    @IBOutlet weak var ccExp: UITextField!
    @IBOutlet weak var ccCVV: UITextField!
    @IBOutlet weak var ccZip: UITextField!
    
    @IBOutlet weak var emailText: UITextField!
    @IBAction func ccSave(_ sender: Any) {
       
        email = emailText.text!
       
        
        shippingAddress = "\(shippingAd.text!), \(shippingCity.text!), \(shippingState.text!), \(shippingZip.text!)"
     
        
        billingAddress = "\(billingAd.text!), \(billingCity.text!), \(billingState.text!), \(billingZip.text!)"
        
        paymentInfo = "\(ccNumber.text!), \(ccExp.text!), \(ccCVV.text!), \(ccZip.text!)"
     
       /*account.setValue(billingAddress, forKey: "billingAddress")
        account.setValue(shippingAddress, forKey: "shippingAddress")
        account.setValue(paymentInfo, forKey: "paymentInfo")
        account.setValue(email, forKey: "email")*/
        
        print(email)
        print(shippingAddress)
        print(billingAddress)
        print(paymentInfo)
        core.addAcc(shippingAddress: shippingAddress as? NSString, billingAddress: billingAddress as? NSString, paymentInfo: paymentInfo as? NSString, email: email as? NSString)
        print(email)
        print(shippingAddress)
        print(billingAddress)
        print(paymentInfo)
        
        core.fetchAcc(shippingAddress: shippingAddress as NSString, billingAddress: billingAddress as NSString, paymentInfo: paymentInfo as NSString)
        print(email)
        print(account.username)
        core.fetchIt(username: account.username as! NSString, email: email as! NSString, phoneNumber : account.phoneNumber as! NSString)
    }
    @IBOutlet weak var titleBar: UINavigationBar!
    
    @IBAction func continueButton(_ sender: Any) {
      /* let stiew = AccountViewController()
        
        let storyboard = storyboard?.instantiateViewController(withIdentifier: "AccountViewController") as! AccountViewController
        stiew.aUser = account.username!
        
        stiew.aEmail = email
        account.setValue(email, forKey: "email")
        stiew.aShip = shippingAddress
        account.setValue(shippingAddress, forKey: "shippingAddress")
        stiew.aBill = billingAddress
        account.setValue(billingAddress, forKey: "billingAddress")
        stiew.aPay = paymentInfo
         account.setValue(paymentInfo, forKey: "paymentInfo")
        
        self.present(storyboard, animated: true)
        */
    }
    
     @IBOutlet weak var titleTop: UINavigationItem!
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
    }
    

}
