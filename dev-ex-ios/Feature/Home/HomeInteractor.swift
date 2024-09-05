//
//  HomeInteractor.swift
//  dev-ex-ios
//
//  Created by Sukrit Chatmeeboon on 30/8/2567 BE.
//

import Foundation

protocol HomeInteractorProtocol {
    var presenter: HomePresenter { get set }

    func tapIncrease()
}

class HomeInteractor: HomeInteractorProtocol {

    // MARK: - Property
    var presenter: HomePresenter
    private var count = 0

    // MARK: - Init
    init(presenter: HomePresenter) {
        self.presenter = presenter
    }

    func tapIncrease() {
        count += 1
        presenter.increaseCount()
    }
}
