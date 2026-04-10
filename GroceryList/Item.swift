//
//  Item.swift
//  GroceryList
//
//  Created by Jasmine Kaur on 10/04/26.
//

import Foundation
import SwiftData

@Model
class Item {
    var title: String
    var isCompleted: Bool
    
    init(title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
