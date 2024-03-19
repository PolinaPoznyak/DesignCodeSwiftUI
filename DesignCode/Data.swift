//
//  Data.swift
//  DesignCode
//
//  Created by Polina Poznyak on 11.03.24.
//

import Foundation

struct NavigationItem: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var icon: String
    var menu: Menu
}

enum MenuTitle: String {
    case compass = "Compass App"
    case card = "3D Card"
    case radial = "Radial Layout"
    case actionbutton = "Gooey Action Button"
    case gooey = "Gooey Menu"
    case charts = "Charts"
    case halfsheet = "Half Sheet"
}

enum MenuIcon: String {
    case compass = "safari"
    case card = "lanyardcard"
    case radial = "clock"
    case actionbutton = "plus.circle"
    case gooey = "drop"
    case charts = "chart.xyaxis.line"
    case halfsheet = "rectangle.portrait.bottomhalf.filled"
}

enum Menu: String {
    case compass
    case card
    case radial
    case actionbutton
    case gooey
    case charts
    case halfsheet
}

var navigationItems = [
    NavigationItem(title: MenuTitle.compass.rawValue,
                   icon: MenuIcon.compass.rawValue,
                   menu: .compass),
    NavigationItem(title: MenuTitle.card.rawValue,
                   icon: MenuIcon.card.rawValue,
                   menu: .card),
    NavigationItem(title: MenuTitle.radial.rawValue,
                   icon: MenuIcon.radial.rawValue,
                   menu: .radial),
    NavigationItem(title: MenuTitle.actionbutton.rawValue,
                   icon: MenuIcon.actionbutton.rawValue,
                   menu: .actionbutton),
    NavigationItem(title: MenuTitle.gooey.rawValue,
                   icon: MenuIcon.gooey.rawValue,
                   menu: .gooey),
    NavigationItem(title: MenuTitle.charts.rawValue,
                   icon: MenuIcon.charts.rawValue,
                   menu: .charts),
    NavigationItem(title: MenuTitle.halfsheet.rawValue,
                   icon: MenuIcon.halfsheet.rawValue,
                   menu: .halfsheet)
]
