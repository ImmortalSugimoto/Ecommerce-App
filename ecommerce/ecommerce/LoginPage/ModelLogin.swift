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





struct DataModel : Codable{
    var data : Accounts
}
struct Accounts : Codable{
    var accountDetails  :  [account]
  
}
struct account : Codable{
    var personalInfo : String?
    var addresses : String?
    var ordersPage : String?
    var paymentTypes: String?
    var username : String?
    var email : String?
    }


import CoreData
import UIKit
class coreDataInfo{
    let context = (UIApplication.shared.delegate as?
                   AppDelegate)?.persistentContainer.viewContext
    func addName(personalInfo : String, ordersPage : String, paymentTypes : String, addresses : String){
    let account = NSEntityDescription.insertNewObject(forEntityName: "account", into: context!) as! Account
    account.personalInfo = personalInfo
    account.ordersPage = ordersPage
    account.paymentTypes = paymentTypes
    account.addresses = addresses
    
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


