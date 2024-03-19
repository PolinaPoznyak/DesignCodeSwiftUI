//
//  GridView.swift
//  DesignCode
//
//  Created by Polina Poznyak on 11.03.24.
//

import SwiftUI

struct RatingGridView: View {

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

            ForEach(ratingData, id: \.self) { item in
                GridRow {
                    Text("\(item.votes)")
                    ProgressView(value: item.progress)
                        .frame(maxWidth: 250)
                    RatingView(rating: item.rating)
                }
            }
        }
        .padding(20)
    }
}

#Preview {
    RatingGridView()
}
