//
//  QuoteOfTheDay.swift
//  myBalance
//
//  Created by Andrew Mogg on 11/14/17.
//  Copyright © 2017 Andrew Mogg. All rights reserved.
//

import Foundation
class QuoteOfTheDayResponse {
    var author: String
    var id: Int
    var quoteText: String
    
    init (author: String,
          id: Int,
          quoteText: String) {
        self.author = author
        self.id = id
        self.quoteText = quoteText
    }
}
