//
//  PinterestFeedView.swift
//  DesignCode
//
//  Created by Polina Poznyak on 18.03.24.
//

import SwiftUI

struct PinterestFeedView: View {

    @State private var columns = 3

    let gridItems = [
        PinterestGridItem(height: 217, imgString: "Wallpaper 1"),
        PinterestGridItem(height: 327, imgString: "Wallpaper 2"),
        PinterestGridItem(height: 300, imgString: "Wallpaper 3"),
        PinterestGridItem(height: 150, imgString: "Wallpaper 1"),
        PinterestGridItem(height: 313, imgString: "Wallpaper 4"),
        PinterestGridItem(height: 200, imgString: "Wallpaper 2")
    ]

    // MARK: - body
    var body: some View {
        NavigationView {
            ScrollView {
                PinterestGridView(gridItems: gridItems,
                                  numOfColumns: columns,
                                  spacing: 20)
            }
            .navigationBarItems(leading: removeColumnButton,
                                trailing: addColumnButton)
            .navigationTitle("Pinterest Grid")
        }
    }

    // MARK: - Remove/Add columns buttons
    var removeColumnButton: some View {
        Button(action: {
            columns -= 1
        })
        {
            Text("Remove column")
        }
        .disabled(columns == 1)
    }

    var addColumnButton: some View {
        Button(action: {
            columns += 1
        })
        {
            Text("Add column")
        }
    }
}

#Preview {
    PinterestFeedView()
}
