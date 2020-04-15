//
//  Constants.swifr.swift
//  Tarot Card
//
//  Created by Nicole Beilis on 4/14/20.
//  Copyright © 2020 nickelogic. All rights reserved.
//

import Foundation

struct Global {
    static let APP_NAME = "Insight Tarot"
    static var question = ""
    static var selectCounter = 1
    static let labels:[Int:String] = [1:"Self", 2:"Situation", 3:"Challenge"]
    static let cards:[Int:String] = [1:"square", 2:"circle", 3:"triangle"]
    static var chosenCard = -1
    static var cardDeck = [Int](repeating: 0, count: 78)
}

struct Font {
    static let REGULAR = "Montserrat-Regular"
    static let MEDIUM = "Montserrat-Medium"
    static let SEMI_BOLD = "Montserrat-SemiBold"
    static let MEDIUM_ITALIC = "Montserrat-MediumItalic"
}

struct Color {
    static let GREY_DEEP = 0x333333
    static let GREY = 0x666666
    static let GREY_PRIME = 0x949494
}
