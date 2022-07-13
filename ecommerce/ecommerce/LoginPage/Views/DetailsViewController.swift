//
//  DetailsViewController.swift
//  ecommerce
//
//  Created by xcode on 7/5/22.
//

import UIKit
import KeychainSwift
import CoreData
class DetailsViewController: UIViewController {
let keychain = KeychainSwift()
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let topString = keychain.get("user") else {return}
        navigationItem.prompt = NSLocalizedString(topString, comment: "")
    }
  
    
    

    // To save the new entity to the persistent store, call
    // save on the context

    @IBOutlet weak var shippingAd: UITextField!
    @IBOutlet weak var shippingCity: UITextField!
    @IBOutlet weak var shippingState: UITextField!
    @IBOutlet weak var shippingZip: UITextField!
   
    @IBAction func shipSave(_ sender: Any) {
        let context = (UIApplication.shared.delegate as?
                       AppDelegate)?.persistentContainer.viewContext
        let account = NSEntityDescription.insertNewObject(forEntityName: "Account", into: context!) as! Account
        let shippingAddress = "\(shippingAd.text!), \(shippingCity.text!), \(shippingState.text!), \(shippingZip.text!)"
        account.shippingAddress = shippingAddress
        do{
            try context?.save()
            print("\(shippingAddress)")
        }
            catch{
                print("data not saved")
            }
    }
    
    @IBAction func billingButton(_ sender: Any) {
        let context = (UIApplication.shared.delegate as?
                       AppDelegate)?.persistentContainer.viewContext
        let account = NSEntityDescription.insertNewObject(forEntityName: "Account", into: context!) as! Account
        let billingAddress = "\(billingAddress.text!), \(billingCity.text!), \(billingState.text!), \(billingZip.text!)"
        account.billingAddress = billingAddress
        do{
            try context?.save()
            print("\(billingAddress)")
        }
            catch{
                print("data not saved")
            }
    }
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
    
    @IBAction func ccSave(_ sender: Any) {
       let context = (UIApplication.shared.delegate as?
                           AppDelegate)?.persistentContainer.viewContext
        let account = NSEntityDescription.insertNewObject(forEntityName: "Account", into: context!) as? Account
            let paymentInfo = "\(ccNumber.text!), \(ccExp.text!), \(ccCVV.text!), \(ccZip.text!)"
        account!.paymentInfo = paymentInfo
            do{
                try context?.save()
                print("\(paymentInfo)")
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
