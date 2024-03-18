//
//  CardView.swift
//  DesignCode
//
//  Created by Polina Poznyak on 12.03.24.
//

import SwiftUI

struct CardView: View {

    // MARK: - body
    var body: some View {
        Grid {
            GridRow {
                card
                card
            }
            GridRow {
                card.gridCellColumns(2)
            }
        }
        .padding(20)
    }

    // MARK: - card
    var card: some View {
        VStack(spacing: 12) {
            Image(systemName: "aspectratio")
                .frame(width: 44, height: 44)
                .foregroundStyle(.linearGradient(colors: [.white, .clear], startPoint: .topLeading, endPoint: .bottomTrailing))
            .background(HexagonShape()
                .stroke()
                .foregroundStyle(.linearGradient(colors: [.white.opacity(0.5), .clear], startPoint: .topLeading, endPoint: .bottomTrailing))
            )
            .background(HexagonShape()
                .foregroundStyle(.linearGradient(colors: [.white.opacity(0.3), .clear], startPoint: .topLeading, endPoint: .bottomTrailing))
            )
            Text("Up to 8K resolution".uppercased())
                .font(.title3.width(.condensed).bold())
                .multilineTextAlignment(.center)
            Text("From huge monitors to the phone, your wallpaper will look great anywhere.")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .opacity(0.7)
        }
        .frame(maxHeight: .infinity)
        .padding().padding(.vertical)
        .background(.black)
        .foregroundStyle(.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke()
                .fill(.white.opacity(0.2))
        )
    }
}

#Preview {
    CardView()
}
