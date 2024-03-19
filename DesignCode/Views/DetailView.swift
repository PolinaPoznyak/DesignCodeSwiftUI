//
//  DetailView.swift
//  DesignCode
//
//  Created by Polina Poznyak on 12.03.24.
//

import SwiftUI

struct DetailView: View {

    var body: some View {
        ScrollView {
            Text("12 transactions".uppercased())
                .font(.subheadline.weight(.medium))
                .foregroundColor(.secondary)
                .padding(.top, 20)
            Text("Entertainment")
                .font(.largeTitle.width(.expanded).weight(.bold))
            ViewThatFits {
                HStack(alignment: .top, spacing: 20) {
                    VStack {
                        ChartView()
                        RatingGridView()
                    }
                    VStack {
                        ChartView()
                        RatingGridView()
                    }
                }
                VStack {
                    ChartView()
                    CardView()
                    RatingGridView()
                }
            }
        }
    }
}

#Preview {
    DetailView()
}
