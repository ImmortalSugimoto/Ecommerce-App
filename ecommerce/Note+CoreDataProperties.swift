//
//  Note+CoreDataProperties.swift
//  ecommerce
//
//  Created by Liban Abdinur on 7/6/22.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var id: Int32
    @NSManaged public var title: String?
    @NSManaged public var desc: String?
    @NSManaged public var deletedData: Date?

}

extension Note : Identifiable {

}
