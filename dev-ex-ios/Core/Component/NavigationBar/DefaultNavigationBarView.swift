//
//  DefaultNavigationBarView.swift
//  dev-ex-ios
//
//  Created by Sukrit Chatmeeboon on 29/7/2567 BE.
//

import SwiftUI

struct DefaultNavigationBarView: View {
    // MARK: - Properties
    @EnvironmentObject var theme: ThemeState
    @ObservedObject var router: Router
    private var title: String

    // MARK: - Layout
    private let navBarHeight: CGFloat = 56

    // MARK: - Text Style
    private var navTitleTextStyle: TextStyler { TextStyler(
        font: theme.font.h3.bold,
        color: theme.color.primary
    )}

    // MARK: - Life Cycle
    init(
        title: String,
        router: Router
    ) {
        self.title = title
        self.router = router
    }

    // MARK: - UI Body
    var body: some View {
            HStack(alignment: .center, spacing: 0) {
                if router.path.count > 0 {
                    backBtn
                }
                navTitle
                    .frameHorizontalExpand(alignment: .leading)
            }
            .padding(.horizontal, 12)
            .frame(height: navBarHeight, alignment: .center)
            .background(theme.color.primary2)
    }

    // MARK: - UI Components
    @ViewBuilder
    private var backBtn: some View {
        Image(systemName: "chevron.left")
            .resizable()
            .renderingMode(.template)
            .scaledToFit()
            .frame(width: 20, height: 20)
            .foregroundStyle(theme.color.primary)
            .frame(width: 44, height: 44)
            .contentShape(.rect)
            .asButton {
                router.navigateBack()
            }
            .padding(.trailing, 12)
    }

    @ViewBuilder
    private var navTitle: some View {
        Text(title)
            .modifier(navTitleTextStyle)
    }
}
