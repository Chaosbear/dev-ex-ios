//
//  AppScreen.swift
//  dev-ex-ios
//
//  Created by Sukrit Chatmeeboon on 22/7/2567 BE.
//

import Foundation

class RouteArg: Hashable {
    var args: [String: AnyObject] = [:]

    static func == (lhs: RouteArg, rhs: RouteArg) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

// the possible destinations in Router
enum Route: Hashable, Identifiable {
    case viewA
    case viewB(String)
    case viewC(args: RouteArg)

    var id: Route { self }
}
