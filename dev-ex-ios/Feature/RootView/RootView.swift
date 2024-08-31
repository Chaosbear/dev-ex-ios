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

    @State private var selectedTab: RootViewTab = .home

    private var itemTextStyle: TextStyler { TextStyler(
        font: theme.font.subTitle1.regular,
        color: theme.color.subTitle1
    )}

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                Text("Home")
                    .asButton {
                        let args = RouteArg()
                        let presenter = HomePresenter(index: 0)
                        let interactor = HomeInteractor(presenter: presenter)
                        args.addValue(key: "presenter", value: presenter)
                        args.addValue(key: "interactor", value: interactor)
                        mainRouter.navigateTo(.home(args: args))
                    }
                    .frameExpand(alignment: .center)
                    .tag(RootViewTab.home)
                mockScreen(RootViewTab.search.title)
                    .tag(RootViewTab.search)
                mockScreen(RootViewTab.library.title)
                    .tag(RootViewTab.library)
                mockScreen(RootViewTab.notification.title)
                    .tag(RootViewTab.notification)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .background(theme.color.background
                .frame(height: 56)
                .frameExpand(alignment: .top)
            )
            tabbar
        }
        .background(theme.color.background, ignoresSafeAreaEdges: [.horizontal, .bottom])
        .background(theme.color.background)
    }

    // MARK: - UI Component
    @ViewBuilder
    private var tabbar: some View {
        RootTabbarView(selectedTab: $selectedTab)
            .ignoresSafeArea(.all, edges: .bottom)
    }

    @ViewBuilder
    private func mockScreen(_ title: String) -> some View {
        VStack(alignment: .center, spacing: 0) {
            NavBarView(
                title: title,
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
                .padding(css: 12, 12, 80, 12)
            }
            .background(theme.color.background)
        }
    }
}

#Preview {
    RootView()
}
