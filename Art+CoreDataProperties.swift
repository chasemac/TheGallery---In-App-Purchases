//
//  Art+CoreDataProperties.swift
//  TheGallery
//
//  Created by Chase McElroy on 7/8/16.
//  Copyright © 2016 Chase McElroy. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Art {

    @NSManaged var title: String?
    @NSManaged var imageName: String?
    @NSManaged var purchased: NSNumber?
    @NSManaged var productIdentifier: String?

}
