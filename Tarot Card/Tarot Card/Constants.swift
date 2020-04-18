//
//  Constants.swift
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
    // font changing : labelName.font = UIFont(name: Font.SEMI_BOLD, size: 35)
    static let REGULAR = "Montserrat-Regular"
    static let MEDIUM = "Montserrat-Medium"
    static let SEMI_BOLD = "Montserrat-SemiBold"
    static let MEDIUM_ITALIC = "Montserrat-MediumItalic"
    static let ITALIC = "Montserrat-Italic"
}

struct Color {
    //UIColor(named: Color.NAME)
    static let GREY_DEEP = "greyDeep" //333333
    static let GREY = "#grey" //666666
    static let GREY_PRIME = "#greyPrime" //949494
    static let GOLD_PRIME = "goldPrime" //a0
    static let BLUE_PRIME = "bluePrime" //0070A7
    static let BLUE_DEEP = "blueDeep" //005C8C
    static let BLUE_LIGHT = "blueLight" //96D8F6
    static let GREY_MEDIUM = "greyMedium" // #CCCCCC
}
