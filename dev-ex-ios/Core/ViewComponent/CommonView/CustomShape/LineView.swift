//
//  LineView.swift
//  dev-ex-ios
//
//  Created by Sukrit Chatmeeboon on 2/8/2567 BE.
//

import SwiftUI

struct Line: Shape {
    enum LineDirection {
        case horizontal, vertical
    }
    private var direction: LineDirection

    init(_ direction: LineDirection) {
        self.direction = direction
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        if direction == .horizontal {
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        } else {
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
        return path
    }
}
