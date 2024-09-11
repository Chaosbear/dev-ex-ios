//
//  HomePresenter.swift
//  dev-ex-ios
//
//  Created by Sukrit Chatmeeboon on 30/8/2567 BE.
//

import Foundation

@MainActor
class HomePresenter: ObservableObject {
    @Published private(set) var index: Int = 0
    @Published private(set) var count: Int = 0

    func increaseCount() async {
        count += 1
    }
}
