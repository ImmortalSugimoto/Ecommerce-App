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

import CoreData
import UIKit
public class coreDataInfo{
   
   
    func addName(personalInfo : NSString, ordersPage : NSString, paymentTypes : NSString, shippingAddress : NSString, billingAddress : NSString, paymentInfo : NSString, userName : NSString){
        let context = (UIApplication.shared.delegate as?
                       AppDelegate)?.persistentContainer.viewContext
    let account = NSEntityDescription.insertNewObject(forEntityName: "Account", into: context!) as? Account
        account!.personalInfo = personalInfo as? String
        account!.ordersPage = ordersPage as? String
        account!.paymentTypes = paymentTypes as? String
        account?.billingAddress = billingAddress as? String
        account?.username = userName as? String
        account!.shippingAddress = shippingAddress as? String
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


