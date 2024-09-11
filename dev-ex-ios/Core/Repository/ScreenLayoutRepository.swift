//
//  ScreenLayoutRepository.swift
//  dev-ex-ios
//
//  Created by Sukrit Chatmeeboon on 8/9/2567 BE.
//

import Foundation

protocol ScreenLayoutRepositoryProtocol {
    func getHomeScreenLayout() async -> ScreenLayoutModel
}

struct MockScreenLayoutRepository: ScreenLayoutRepositoryProtocol {
    func getHomeScreenLayout() async -> ScreenLayoutModel {
        return ScreenLayoutModel(totalSection: 8, list: [])
    }
}
