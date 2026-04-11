//
//  Tip.swift
//  GroceryList
//
//  Created by Jasmine Kaur on 11/04/26.
//

import Foundation
import TipKit

struct ButtonTip: Tip {
    var title: Text = Text("Essential Foods")
    var message: Text? = Text("Add some everyday items to the shopping List")
    var image: Image? = Image(systemName: "info.circle")
}
