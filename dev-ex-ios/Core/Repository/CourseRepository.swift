//
//  CourseRepository.swift
//  dev-ex-ios
//
//  Created by Sukrit Chatmeeboon on 14/9/2567 BE.
//

import Foundation

protocol CourseRepositoryProtocol {
    func getCourseList(_ model: ScreenSectionModel) async -> CourseListModel
}

struct MockCourseRepositoryRepository: CourseRepositoryProtocol {
    func getCourseList(_ model: ScreenSectionModel) async -> CourseListModel {
        return CourseListModel(
            page: .init(),
            list: []
        )
    }
}
