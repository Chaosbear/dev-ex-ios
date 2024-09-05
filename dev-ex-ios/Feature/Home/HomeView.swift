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

    @StateObject private var presenter: HomePresenter
    @State private var interactor: HomeInteractorProtocol

    // MARK: - Init
    init(
        presenter: HomePresenter,
        interactor: HomeInteractorProtocol
    ) {
        self._presenter = StateObject(wrappedValue: presenter)
        self._interactor = State(wrappedValue: interactor)
    }

    // MARK: - Text Style

    var body: some View {
        VStack(alignment: .center, spacing: 12) {
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
        .frameExpand(alignment: .center)
        .toolbar(.hidden, for: .navigationBar)

    }
}
