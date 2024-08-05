//
//  RootView.swift
//  dev-ex-ios
//
//  Created by Sukrit Chatmeeboon on 5/8/2567 BE.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var mainRouter: Router
    @EnvironmentObject var theme: ThemeState

    private var itemTextStyle: TextStyler { TextStyler(
        font: theme.font.subTitle1.regular,
        color: theme.color.subTitle1
    )}

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            NavBarView(
                title:"Main Screen",
                hasBackBtn: false,
                router: mainRouter
            )
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(1...50, id: \.self) { index in
                        Text("View \(index)")
                            .modifier(itemTextStyle)
                            .frameHorizontalExpand(alignment: .leading)
                            .padding(18)
                            .background(LinearGradient(
                                colors: [
                                    theme.color.primary,
                                    theme.color.primary2
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            ))
                            .cornerRadius(12, corners: .allCorners)
                            .shadow(radius: 4, y: 2)
                            .compositingGroup()
                            .asButton {
                                mainRouter.navigateTo(.viewB("View Index \(index)"))
                            }
                    }
                }
                .padding(css: 12, 12, 40, 12)
            }
        }
    }
}

#Preview {
    RootView()
}
