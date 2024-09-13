//
//  ArticleRepository.swift
//  dev-ex-ios
//
//  Created by Sukrit Chatmeeboon on 14/9/2567 BE.
//

import Foundation

protocol ArticleRepositoryProtocol {
    func getArticleList(_ model: ScreenSectionModel) async -> ArticleListModel
}

struct MockArticleRepositoryRepository: ArticleRepositoryProtocol {
    func getArticleList(_ model: ScreenSectionModel) async -> ArticleListModel {
        return ArticleListModel(
            page: .init(),
            list: []
        )
    }
}
