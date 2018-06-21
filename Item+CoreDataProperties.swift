//
//  Item+CoreDataProperties.swift
//  Fortune Munyai
//
//  Created by Fortune Munyai
//  Copyright © 2018 Fortune Munyai. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Item {

    @NSManaged var displayPrice: String?
    @NSManaged var image: Data?
    @NSManaged var name: String?
    @NSManaged var qty: NSNumber?
    @NSManaged var roundPrice: NSNumber?

}
