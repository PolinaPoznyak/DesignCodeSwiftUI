//
//  ChartValue.swift
//  DesignCode
//
//  Created by Polina Poznyak on 18.03.24.
//

import Foundation

struct ChartValue: Identifiable {
    var id = UUID()
    var day: String
    var value: Double
}

let chartData = [
    ChartValue(day: "Jun 1", value: 200),
    ChartValue(day: "Jun 2", value: 96),
    ChartValue(day: "Jun 3", value: 312),
    ChartValue(day: "Jun 4", value: 256),
    ChartValue(day: "Jun 5", value: 505),
]

let chartData2 = [
    ChartValue(day: "Jun 1", value: 151),
    ChartValue(day: "Jun 2", value: 192),
    ChartValue(day: "Jun 3", value: 176),
    ChartValue(day: "Jun 4", value: 158),
    ChartValue(day: "Jun 5", value: 401),
]
