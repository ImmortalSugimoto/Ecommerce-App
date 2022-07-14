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
    @IBOutlet weak var billingAddress: UITextField!
    @IBOutlet weak var billingCity: UITextField!
    @IBOutlet weak var billingState: UITextField!
    @IBOutlet weak var billingZip: UITextField!
    
   
    @IBOutlet weak var ccNumber: UITextField!
    @IBOutlet weak var ccExp: UITextField!
    @IBOutlet weak var ccCVV: UITextField!
    @IBOutlet weak var ccZip: UITextField!
    
    @IBOutlet weak var emailText: UITextField!
    @IBAction func ccSave(_ sender: Any) {
        core.addAcc(shippingAddress: account.shippingAddress as! NSString, billingAddress: account.billingAddress! as NSString, paymentInfo: account.paymentInfo! as NSString, email: account.email! as NSString)
      
        let email = emailText.text
        account.email! = email!
        
        let shippingAddress = "\(shippingAd.text!), \(shippingCity.text!), \(shippingState.text!), \(shippingZip.text!)"
            account.shippingAddress = shippingAddress
        
        let billingAddress = "\(billingAddress.text!), \(billingCity.text!), \(billingState.text!), \(billingZip.text!)"
            account.billingAddress = billingAddress
        
        let paymentInfo = "\(ccNumber.text!), \(ccExp.text!), \(ccCVV.text!), \(ccZip.text!)"
            account.paymentInfo = paymentInfo
       /*account.setValue(billingAddress, forKey: "billingAddress")
        account.setValue(shippingAddress, forKey: "shippingAddress")
        account.setValue(paymentInfo, forKey: "paymentInfo")
        account.setValue(email, forKey: "email")*/

            do{
                try context?.save()
                print(account.paymentInfo)
                print(account.shippingAddress)
                print(account.billingAddress)
                print(account.paymentInfo)
            }
                catch{
                    print("data not saved")
                }
    }
    @IBOutlet weak var titleBar: UINavigationBar!
    
    
     @IBOutlet weak var titleTop: UINavigationItem!
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
    }
    

}
