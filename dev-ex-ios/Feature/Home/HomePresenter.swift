//
//  HomePresenter.swift
//  dev-ex-ios
//
//  Created by Sukrit Chatmeeboon on 30/8/2567 BE.
//

import Foundation

class HomePresenter: ObservableObject {
    @Published private(set) var index: Int
    @Published private(set) var count: Int = 0


    init(index: Int) {
        self.index = index
    }

    func increaseCount() {
        count += 1
    }
}
