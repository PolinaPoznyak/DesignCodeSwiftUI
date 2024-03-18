//
//  GridView.swift
//  DesignCode
//
//  Created by Polina Poznyak on 11.03.24.
//

import SwiftUI

struct GridView: View {

    var body: some View {
        Grid(alignment: .leading, horizontalSpacing: 12, verticalSpacing: 12) {
            GridRow {
                Text("Votes")
                    .gridColumnAlignment(.trailing)
                    .gridCellColumns(2)
                Text("Rating")
                    .gridColumnAlignment(.trailing)
            }
            .font(.footnote)
            .foregroundColor(.secondary)
            Divider()
                .gridCellUnsizedAxes(.horizontal)
            GridRow {
                Text("4")
                    .frame(width: 30, alignment: .trailing)
                ProgressView(value: 0.1)
                    .frame(maxWidth: 250)
                RatingView(rating: 1)
            }
            GridRow {
                Text("21")
                ProgressView(value: 0.2)
                    .frame(maxWidth: 250)
                RatingView(rating: 2)
            }
            GridRow {
                Text("5")
                ProgressView(value: 0.2)
                    .frame(maxWidth: 250)
                RatingView(rating: 3)
            }
            GridRow {
                Text("52")
                ProgressView(value: 0.5)
                    .frame(maxWidth: 250)
                RatingView(rating: 4)
            }
            GridRow {
                Text("67")
                ProgressView(value: 0.6)
                    .frame(maxWidth: 250)
                RatingView(rating: 5)
            }
        }
        .padding(20)
    }
}

#Preview {
    GridView()
}
