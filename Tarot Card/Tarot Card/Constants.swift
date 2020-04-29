//
//  Constants.swift
//  Tarot Card
//
//  Created by Nicole Beilis on 4/14/20.
//  Copyright © 2020 nickelogic. All rights reserved.
//

import Foundation

struct Global {
    static var question = ""
    static var selectCounter = 1
    static let labels:[Int:String] = [1:"Self", 2:"Situation", 3:"Challenge"]
    static let cards:[Int:String] = [1:"01-Ace-of-Coins", 2:"01-Ace-of-Swords", 3:"01-The-Magician"]
    static let cardNames:[Int:String] = [1:"Ace of Coins", 2:"Ace of Swords", 3:"The Magician"]
    static let cardFortunes:[Int:String] = [1:"In a general context, the Ace of Pentacles represents new beginnings and prosperity. It is a very good card to get in a Tarot spread as it signifies starting something new which will be very positive for you. ... This Minor Arcana card also signifies abundance in all areas of life and security and stability", 2:"In a general context, the Ace of Swords represents new ideas, new beginnings, new projects, new plans and breakthroughs. It also indicates intellectual ability, mental clarity, clear thinking and the ability to concentrate. This Minor Arcana signifies communication, vision, force, focus and intensity.", 3:"When the Magician appears in a spread, it points to the talents, capabilities and resources at the querent's disposal to succeed. The message is to tap into one's full potential rather than holding back, especially when there is a need to transform something."]
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
    static let GREY_LIGHT = "#greyLight"
    static let GOLD_PRIME = "goldPrime" //a0
    static let GOLD_DEEP = "goldDeep" //a0
    static let GOLD_LIGHT = "goldLight" //a0
    static let GOLD_MEDIUM = "goldMedium" //a0
    static let BLUE_PRIME = "bluePrime" //0070A7
    static let BLUE_DEEP = "blueDeep" //005C8C
    static let BLUE_LIGHT = "blueLight" //96D8F6
    static let GREY_MEDIUM = "greyMedium" // #CCCCCC
    static let BLUE_BRIGHT = "blueBright"
    static let BLUE_MEDIUM = "blueMedium"
}
