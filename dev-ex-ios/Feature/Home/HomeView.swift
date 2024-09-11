//
//  HomeView.swift
//  dev-ex-ios
//
//  Created by Sukrit Chatmeeboon on 30/8/2567 BE.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Property
    @EnvironmentObject var mainRouter: Router
    @EnvironmentObject var theme: ThemeState

    @ObservedObject private var presenter: HomePresenter
    private var interactor: HomeInteractorProtocol

    // MARK: - Init
    init(
        presenter: HomePresenter,
        interactor: HomeInteractorProtocol
    ) {
        self.presenter = presenter
        self.interactor = interactor
    }

    // MARK: - Text Style
    private var navTitleTextStyle: TextStyler { TextStyler(
        font: theme.font.h3.bold,
        color: theme.color.h1
    )}

    // MARK: - Layout
    private let sidePadding: CGFloat = isPhoneGlobal ? 12 : 40

    // MARK: - UI Body
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            navbar

            ScrollView(showsIndicators: true) {
                Text("Home \(presenter.index)")
                Text("Count \(presenter.count)")
                Text("+")
                    .foregroundStyle(Color.white)
                    .frame(width: 80, height: 50, alignment: .center)
                    .background(Color.blue)
                    .cornerRadius(8, corners: .allCorners)
                    .contentShape(.rect)
                    .asButton {
                        interactor.tapIncrease()
                    }

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: -20) {
                        ForEach(0...8, id: \.self) { index in
                            Text("Hex \(index)")
                                .frame(width: 104, height: 90)
                                .background(Color.blue.opacity(0.4))
                                .chamferCorner(x: 26, y: 45, corners: .allCorners)
                                .contentShape(ChampferRectangle(x: 26, y: 45, corners: .allCorners))
                                .asButton {
                                    print("[devex] index: \(index)")
                                }
                                .padding(.top, index % 2 == 0 ? 0 : 45)
                        }
                    }
                    .padding(.vertical, 2)
                }
            }
        }
    }

    // MARK: - UI Component
    @ViewBuilder
    private var navbar: some View {
        HStack(alignment: .center, spacing: 0) {
            Image(systemName: "person.crop.circle")
                .resizable()
                .renderingMode(.template)
                .frame(width: 40, height: 40)
                .foregroundStyle(Color.gray)
                .clipShape(.circle)
                .frame(height: 56)
                .padding(.leading, sidePadding)
                .padding(.trailing, 12)
                .asButton {
                    print("go to setting")
                }
            Text("Home")
                .modifier(navTitleTextStyle)
                .frameHorizontalExpand(alignment: .leading)
                .padding(.trailing, sidePadding)
        }
        .frame(height: 56, alignment: .center)
    }
}
