//
//  UIScreenExtension.swift
//  dev-ex-ios
//
//  Created by Sukrit Chatmeeboon on 5/8/2567 BE.
//

import UIKit

extension UIScreen {
    static var current: UIScreen? {
        UIWindow.current?.windowScene?.screen
    }

    func screenWidth() -> CGFloat {
        return min(bounds.width, bounds.height)
    }

    func screenHeight() -> CGFloat {
        return max(bounds.width, bounds.height)
    }
}

extension UIWindow {
    static var safeAreaInsets: UIEdgeInsets {
        current?.safeAreaInsets ?? .init(top: 0, left: 0, bottom: 0, right: 0)
    }

    static var current: UIWindow? {
        for scene in UIApplication.shared.connectedScenes {
            guard let windowScene = scene as? UIWindowScene else { continue }
            for window in windowScene.windows {
                if window.isKeyWindow { return window }
            }
        }
        return nil
    }
}
