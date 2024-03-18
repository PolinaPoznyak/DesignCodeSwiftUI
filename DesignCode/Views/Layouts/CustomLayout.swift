//
//  CustomLayout.swift
//  DesignCode
//
//  Created by Polina Poznyak on 18.03.24.
//

import SwiftUI

struct CustomLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        for (index, subviews) in subviews.enumerated() {
            // Position
            var point = CGPoint(x: 20 * index, y: 20 * index).applying(CGAffineTransform(rotationAngle: CGFloat(6 * index + 6)))

            //Center
            point.x += bounds.midX
            point.y += bounds.midY

            subviews.place(at: point, anchor: .center, proposal: .unspecified)
        }
    }
}
