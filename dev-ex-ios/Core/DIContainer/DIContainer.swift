//
//  DIContainer.swift
//  dev-ex-ios
//
//  Created by Sukrit Chatmeeboon on 30/8/2567 BE.
//

import Foundation
import Swinject

struct DIContainer {
    static let shared = {
        let container = Container()

        setUpDependency(container)
        
        return container
    }

    static func setUpDependency(_ container: Container) {

    }
}
