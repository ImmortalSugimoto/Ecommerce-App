//
//  ModelLogin.swift
//  ecommerce
//
//  Created by xcode on 6/29/22.
//

import Foundation
import KeychainSwift
let keychain = KeychainSwift()
struct reg : Codable{
    var user = "user"
    var password = "password"
}
struct ViewControl{

}

/*struct account : Codable{
    var personalInfo : String
    var billingAddress : String
    var shippingAddress : String
    var paymentInfo: String
    var paymentTypes : String
    var username : String
    var email : String
    }

*/
public var core = coreDataInfo()
import CoreData
import UIKit
public class coreDataInfo{

    public func fetchAcc(shippingAddress : NSString, billingAddress : NSString, paymentInfo : NSString){
        let context = (UIApplication.shared.delegate as?
                       AppDelegate)?.persistentContainer.viewContext
          let request = Account.fetchRequest() as NSFetchRequest<Account>
          let account = NSEntityDescription.insertNewObject(forEntityName: "Account", into: context!) as! Account
          account.shippingAddress = shippingAddress as String
          account.billingAddress = billingAddress as String
          account.paymentInfo = paymentInfo as String
        
    }
    public func fetchIt(username : NSString, email : NSString, phoneNumber : NSString){
        let context = (UIApplication.shared.delegate as?
                       AppDelegate)?.persistentContainer.viewContext
          let request = Account.fetchRequest() as NSFetchRequest<Account>
          let account = NSEntityDescription.insertNewObject(forEntityName: "Account", into: context!) as! Account
          account.username = username as String
          account.email = email as String
        account.phoneNumber = phoneNumber as String
      
    }
    
    public func addAcc(shippingAddress : NSString?, billingAddress : NSString?, paymentInfo : NSString?, email : NSString?){
        let context = (UIApplication.shared.delegate as?
                       AppDelegate)?.persistentContainer.viewContext
    let account = NSEntityDescription.insertNewObject(forEntityName: "Account", into: context!) as? Account
             
        do{
            try context?.save()
            print("data saved")
        }
            catch{
                print("data not saved")
            }
        }
    
    public func addReg(username : NSString!, email : NSString!, phoneNumber : NSString!){
        let context = (UIApplication.shared.delegate as?
                       AppDelegate)?.persistentContainer.viewContext
    let account = NSEntityDescription.insertNewObject(forEntityName: "Account", into: context!) as! Account
      
    do{
        try context?.save()
        print("data saved")
        print(account.username)
        print(account.email)
    }
        catch{
            print("data not saved")
        }
    }
}
let context = (UIApplication.shared.delegate as?
               AppDelegate)?.persistentContainer.viewContext
var account = NSEntityDescription.insertNewObject(forEntityName: "Account", into: context!) as! Account


    /*var storyboardViews = [LoginViewController, RegisterViewController, DetailsViewController, LanguageViewController, ContactViewController, DetailsViewController, AccountViewController]
    */


