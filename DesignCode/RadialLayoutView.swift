//
//  RadialLayoutView.swift
//  DesignCode
//
//  Created by Polina Poznyak on 12.03.24.
//

import SwiftUI

struct RadialLayoutView: View {
    var icons = ["calendar", "message", "figure.walk", "music.note"]

    var body: some View {
        CustomLayout {
            ForEach(icons, id: \.self) { item in
                Circle()
                    .frame(width: 44)
                    .foregroundColor(.black)
                    .overlay(Image(systemName: item).foregroundColor(.white))
            }
        }
    }
}

#Preview {
    RadialLayoutView()
}

struct CustomLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        for (index, subviews) in subviews.enumerated() {
            // Position
            var point = CGPoint(x: 50 * index, y: 50 * index).applying(CGAffineTransform(rotationAngle: 5))

            //Center
            point.x += bounds.midX
            point.y += bounds.midY

            subviews.place(at: point, anchor: .center, proposal: .unspecified)
        }
    }
}
