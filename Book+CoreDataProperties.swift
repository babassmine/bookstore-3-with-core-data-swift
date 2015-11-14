//
//  Book+CoreDataProperties.swift
//  BookStore3
//
//  Created by Abass Sesay on 11/14/15.
//  Copyright © 2015 Abass Sesay. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Book {

    @NSManaged var price: NSNumber?
    @NSManaged var title: String?
    @NSManaged var yearPublished: NSNumber?
    @NSManaged var author: NSManagedObject?

}
