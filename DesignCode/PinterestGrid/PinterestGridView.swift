//
//  PinterestGridView.swift
//  DesignCode
//
//  Created by Polina Poznyak on 18.03.24.
//

import SwiftUI

struct PinterestGridView: View {

    struct Column: Identifiable {
        let id = UUID()
        var gridItems = [PinterestGridItem]()
    }

    let columns: [Column]

    var spacing: CGFloat = 10
    let horizontalPadding: CGFloat

    // MARK: - init
    init(gridItems: [PinterestGridItem], numOfColumns: Int, spacing: CGFloat = 20, horizontalPadding: CGFloat = 20) {
        self.spacing = spacing
        self.horizontalPadding = horizontalPadding

        var columns = [Column]()
        for _ in 0 ..< numOfColumns {
            columns.append(Column())
        }

        var columnsHeight = Array<CGFloat>(repeating: 0, count: numOfColumns)

        for gridItem in gridItems {
            var smalllestColumnItem = 0
            var smallestHeight = columnsHeight.first!
            for i in 1 ..< columnsHeight.count {
                let currentHeight = columnsHeight[i]
                if currentHeight < smallestHeight {
                    smallestHeight = currentHeight
                    smalllestColumnItem = i
                }
            }
            columns[smalllestColumnItem].gridItems.append(gridItem)
            columnsHeight[smalllestColumnItem] += gridItem.height
        }
        self.columns = columns
    }

    // MARK: - body
    var body: some View {
        HStack(alignment: .top, spacing: spacing) {
            ForEach(columns) { column in
                LazyVStack(spacing: spacing) {
                    ForEach(column.gridItems) { gridItem in
                        
                        getItemView(gridItem: gridItem)
                    }
                }
            }
        }
        .padding(.horizontal, horizontalPadding)
    }

    // MARK: - functions
    func getItemView(gridItem: PinterestGridItem) -> some View {
        ZStack {
            GeometryReader { reader in
                Image(gridItem.imgString)
                    .resizable()
                    .scaledToFill()
                    .frame(width: reader.size.width,
                           height: reader.size.height,
                           alignment: .center)
            }
        }
        .frame(height: gridItem.height)
        .frame(maxWidth: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.3), radius: 10, y: 10)
    }
}

#Preview {
    PinterestGridView(gridItems: [PinterestGridItem(height: 100, imgString: "Wallpaper 1")], numOfColumns: 3)
}
