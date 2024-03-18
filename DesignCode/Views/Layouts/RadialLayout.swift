//
//  RadialLayout.swift
//  DesignCode
//
//  Created by Polina Poznyak on 18.03.24.
//

import SwiftUI

struct RadialLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {

        let raduis = bounds.width / 3.0
        let angle = Angle.degrees(360.0 / Double(subviews.count)).radians

        for (index, subviews) in subviews.enumerated() {
            // Position
            var point = CGPoint(x: 0, y: -raduis).applying(CGAffineTransform(rotationAngle: angle * Double(index)))

            //Center
            point.x += bounds.midX
            point.y += bounds.midY

            subviews.place(at: point, anchor: .center, proposal: .unspecified)
        }
    }
}
