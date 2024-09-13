//
//  ArticleSectionInteractor.swift
//  dev-ex-ios
//
//  Created by Sukrit Chatmeeboon on 14/9/2567 BE.
//

import Foundation

protocol ArticleSectionInteractorProtocol {
    var presenter: ArticleSectionPresenter? { get set }

}

class ArticleSectionInteractor: ArticleSectionInteractorProtocol {

    // MARK: - Property
    weak var presenter: ArticleSectionPresenter?
    private var count = 0

    // MARK: - Init
    init(presenter: ArticleSectionPresenter?) {
        self.presenter = presenter
    }

    // MARK: - Event

}
