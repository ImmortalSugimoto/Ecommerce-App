//
//  DetailsViewController.swift
//  ecommerce
//
//  Created by xcode on 7/5/22.
//

import UIKit
import KeychainSwift

class DetailsViewController: UIViewController {
let keychain = KeychainSwift()
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let topString = keychain.get("user") else {return}
        navigationItem.prompt = NSLocalizedString(topString, comment: "")
        
    }
    let context = (UIApplication.shared.delegate as?
                   AppDelegate)?.persistentContainer.viewContext
  
    // Create a new UserEntity in the
    // NSManagedObjectContext context
    let account = Account()
    func saveData(){
    account.username = "User Name"
    account.email = "user@domain.com"
    account.shippingAddress =
    "street, city, state, zip"
    account.billingAddress = "street, city, state, zip"
    

    // To save the new entity to the persistent store, call
    // save on the context
    do {
        try context!.save()
    }
    catch {
        // Handle Error
    }
    }
    @IBOutlet weak var shippingAddress: UITextField!
    @IBOutlet weak var shippingCity: UITextField!
    @IBOutlet weak var shippingState: UITextField!
    @IBOutlet weak var shippingZip: UITextField!
    
    @IBAction func shipSave(_ sender: Any) {
    }
    @IBOutlet weak var billingAddress: UITextField!
    @IBOutlet weak var billingCity: UITextField!
    @IBOutlet weak var billingState: UITextField!
    @IBOutlet weak var billingZip: UITextField!
    
    @IBAction func billSave(_ sender: Any) {
    }
    @IBOutlet weak var ccNumber: UITextField!
    @IBOutlet weak var ccExp: UITextField!
    @IBOutlet weak var ccCVV: UITextField!
    @IBOutlet weak var ccZip: UITextField!
    
    @IBAction func ccSave(_ sender: Any) {
    }
    @IBOutlet weak var titleBar: UINavigationBar!
    
    
     @IBOutlet weak var titleTop: UINavigationItem!
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
    }
    

}
