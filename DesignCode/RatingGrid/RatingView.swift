//
//  RatingView.swift
//  DesignCode
//
//  Created by Polina Poznyak on 18.03.24.
//

import SwiftUI

struct RatingView : View {
    var rating = 3
    let list = [1, 2, 3, 4, 5]
    var body: some View {
        HStack(spacing: 0) {
            ForEach(list, id: \.self) { item in
                Image(systemName: rating >= item ? "star.fill" : "star")
            }
        }
    }
}

#Preview {
    RatingView()
}
