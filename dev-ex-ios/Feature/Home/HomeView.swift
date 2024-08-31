//
//  HomeView.swift
//  dev-ex-ios
//
//  Created by Sukrit Chatmeeboon on 30/8/2567 BE.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Configure
    static func configure(index: Int) -> HomeView {
        print("[devex] configure home")
        let presenter = HomePresenter(index: index)
        return HomeView(
            presenter: presenter,
            interactor: HomeInteractor(presenter: presenter)
        )
    }

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
                .asButton {
                    mainRouter.navigateTo(.home(presenter.index + 1))
                }
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
        }
        .frameExpand(alignment: .center)
        .toolbar(.hidden, for: .navigationBar)

    }
}
