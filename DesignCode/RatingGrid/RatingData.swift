//
//  RatingData.swift
//  DesignCode
//
//  Created by Polina Poznyak on 19.03.24.
//

import Foundation

struct RatingData: Hashable {
    var votes: Int
    var progress: Double
    var rating: Int
}

let ratingData: [RatingData] = [
    RatingData(votes: 4, progress: 0.1, rating: 1),
    RatingData(votes: 21, progress: 0.2, rating: 2),
    RatingData(votes: 5, progress: 0.2, rating: 3),
    RatingData(votes: 52, progress: 0.5, rating: 4),
    RatingData(votes: 67, progress: 0.6, rating: 5)
]
