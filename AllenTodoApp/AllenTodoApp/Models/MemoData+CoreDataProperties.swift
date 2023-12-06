//
//  MemoData+CoreDataProperties.swift
//  AllenTodoApp
//
//  Created by 변상필 on 12/6/23.
//
//

import Foundation
import CoreData


extension MemoData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MemoData> {
        return NSFetchRequest<MemoData>(entityName: "MemoData")
    }

    @NSManaged public var color: Int64
    @NSManaged public var date: Date?
    @NSManaged public var memoText: String?

}

extension MemoData : Identifiable {

}
