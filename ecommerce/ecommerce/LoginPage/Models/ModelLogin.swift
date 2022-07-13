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
   
   
    public func fetchIt(username : NSString, emails : NSString){
        let context = (UIApplication.shared.delegate as?
                       AppDelegate)?.persistentContainer.viewContext
          let request = Account.fetchRequest() as NSFetchRequest<Account>
          var account = NSEntityDescription.insertNewObject(forEntityName: "Account", into: context!) as! Account
        account.username = username as String
        account.email = emails as String
        print("\(username)")
    }
    
    public func addAcc(shippingAddress : NSString, billingAddress : NSString, paymentInfo : NSString){
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
    
   public func addReg(username : NSString!, email : NSString!){
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
}

   
    


    struct Usernamze: Codable{
       var usernamze : [Usernamze]?
        
    }
    struct usernamze : Codable{
        var username : String?
        var password : String?
        var reEnterPass : String?
        var phoneNumber : String?
        var otp : Int?
        var email : String?
        
        
    }

    
    /*var storyboardViews = [LoginViewController, RegisterViewController, DetailsViewController, LanguageViewController, ContactViewController, DetailsViewController, AccountViewController]
    */


