//
//  ArticleSectionPresenter.swift
//  dev-ex-ios
//
//  Created by Sukrit Chatmeeboon on 14/9/2567 BE.
//

import Foundation

@MainActor
class ArticleSectionPresenter: ObservableObject {
    // MARK: - Property
    @Published private(set) var section: ScreenSectionModel?
    @Published private(set) var articleList: [ArticleCardData] = []

    // MARK: - Event
    func setArticleList(_ list: [ArticleCardData]) async {
        articleList = list
    }
}
