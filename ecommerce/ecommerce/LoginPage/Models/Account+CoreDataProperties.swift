//
//  Account+CoreDataProperties.swift
//  
//
//  Created by xcode on 7/12/22.
//
//

import Foundation
import CoreData


extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account")
    }

    @NSManaged public var billingAddress: String?
    @NSManaged public var email: String?
    @NSManaged public var ordersPage: String?
    @NSManaged public var paymentTypes: String?
    @NSManaged public var personalInfo: String?
    @NSManaged public var shippingAddress: String?
    @NSManaged public var username: String?
    @NSManaged public var paymentInfo: String?

}
