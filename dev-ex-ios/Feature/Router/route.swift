//
//  AppScreen.swift
//  dev-ex-ios
//
//  Created by Sukrit Chatmeeboon on 22/7/2567 BE.
//

import Foundation

class RouteArg: Hashable {
    enum CommonKey: String {
        case presenter
        case interactor
    }

    private var args: [String: AnyObject] = [:]

    static func == (lhs: RouteArg, rhs: RouteArg) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }

    func value(key: String) -> AnyObject? {
        return args[key]
    }

    func addValue(key: String, value: AnyObject) {
        args[key] = value
    }

    /// store presenter in route to prevent multiple presenter initiation
    /// when we push the view to navigation stack even if we mark presenter with @StateObject
    func presenter() -> AnyObject? {
        args[CommonKey.presenter.rawValue]
    }

    /// store interactor in route to prevent multiple interactor initiation
    /// when we push the view to navigation stack even if we mark interactor with @StateObject
    func interactor() -> AnyObject? {
        args[CommonKey.interactor.rawValue]
    }

    func addPresenter(value: AnyObject) {
        args[CommonKey.presenter.rawValue] = value
    }

    func addInteractor(value: AnyObject) {
        args[CommonKey.interactor.rawValue] = value
    }
}

// the possible destinations in Router
enum Route: Hashable, Identifiable {
    case profile(args: RouteArg)
    case authorProfile(args: RouteArg)
    case article(args: RouteArg)
    case course(args: RouteArg)
    case setting(args: RouteArg)
    case themeSetting(args: RouteArg)

    var id: Route { self }
}
