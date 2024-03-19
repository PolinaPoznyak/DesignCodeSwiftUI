//
//  GridItem.swift
//  DesignCode
//
//  Created by Polina Poznyak on 18.03.24.
//

import Foundation

struct PinterestGridItem: Identifiable {
    let id = UUID()
    let height: CGFloat
    let imgString: String
}

let gridItems = [
    PinterestGridItem(height: 217, imgString: "Wallpaper 1"),
    PinterestGridItem(height: 327, imgString: "Wallpaper 2"),
    PinterestGridItem(height: 300, imgString: "Wallpaper 3"),
    PinterestGridItem(height: 150, imgString: "Wallpaper 1"),
    PinterestGridItem(height: 313, imgString: "Wallpaper 4"),
    PinterestGridItem(height: 200, imgString: "Wallpaper 2")
]
