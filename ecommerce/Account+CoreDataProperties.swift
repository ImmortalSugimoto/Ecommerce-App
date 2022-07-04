//
//  Account+CoreDataProperties.swift
//  ecommerce
//
//  Created by xcode on 7/3/22.
//
//

import Foundation
import CoreData


extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account")
    }

    @NSManaged public var personalInfo: String?
    @NSManaged public var addresses: String?
    @NSManaged public var ordersPage: String?
    @NSManaged public var paymentTypes: String?

}

extension Account : Identifiable {

}
