//
//  AppScreen.swift
//  dev-ex-ios
//
//  Created by Sukrit Chatmeeboon on 22/7/2567 BE.
//

import Foundation

class RouteArg: Hashable {
    private var args: [String: AnyObject] = [:]

    func value(key: String) -> AnyObject? {
        return args[key]
    }

    func addValue(key: String, value: AnyObject) {
        args[key] = value
    }

    static func == (lhs: RouteArg, rhs: RouteArg) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

// the possible destinations in Router
enum Route: Hashable, Identifiable {
    case home(args: RouteArg)
    case viewB(String)
    case viewC(args: RouteArg)

    var id: Route { self }
}
