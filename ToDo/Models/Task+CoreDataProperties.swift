//
//  Task+CoreDataProperties.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 18.08.2026.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var details: String?
    @NSManaged public var creationDate: Date?
    @NSManaged public var status: Int64
}

extension Task : Identifiable {
}
