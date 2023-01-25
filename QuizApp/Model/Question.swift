//
//  Question.swift
//  QuizApp
//
//  Created by Adil Gumarov on 17.01.2023.
//

import Foundation

struct Question {
    let flag: String
    let name: String
    let capital: String
    
    init(flag: String, country: String, capital: String) {
        self.flag = flag
        name = country
        self.capital = capital
    }
}
