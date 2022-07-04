//
//  ModelLogin.swift
//  ecommerce
//
//  Created by xcode on 6/29/22.
//

import Foundation

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
        init(personalInfo : String, addresses : String, ordersPage : String, paymentTypes : String){
            self.personalInfo = personalInfo
            self.addresses = addresses
            self.ordersPage = ordersPage
            self.paymentTypes = paymentTypes
            
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
  

