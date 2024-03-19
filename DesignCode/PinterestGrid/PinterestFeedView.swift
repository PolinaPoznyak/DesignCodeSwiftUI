//
//  PinterestFeedView.swift
//  DesignCode
//
//  Created by Polina Poznyak on 18.03.24.
//

import SwiftUI

struct PinterestFeedView: View {

    @State private var columns = 3

    // MARK: - body
    var body: some View {
        NavigationView {
            ScrollView {
                PinterestGridView(gridItems: gridItems,
                                  numOfColumns: columns,
                                  spacing: 20)
            }
            .navigationBarItems(
                leading: columnButton(action: { columns -= 1 }, title: "Remove column", isEnabled: columns > 1),
                trailing: columnButton(action: { columns += 1 }, title: "Add column", isEnabled: true)
            )
            .navigationTitle("Pinterest Grid")
        }
    }

    // MARK: - Column Button
    @ViewBuilder
    func columnButton(action: @escaping () -> Void, title: String, isEnabled: Bool) -> some View {
        Button(action: action) {
            Text(title)
        }
        .disabled(!isEnabled)
    }
}

#Preview {
    PinterestFeedView()
}
