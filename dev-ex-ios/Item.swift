//
//  Item.swift
//  dev-ex-ios
//
//  Created by Sukrit Chatmeeboon on 22/4/2567 BE.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
