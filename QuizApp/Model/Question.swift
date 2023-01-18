//
//  Question.swift
//  QuizApp
//
//  Created by Adil Gumarov on 17.01.2023.
//

import Foundation

struct Question {
    let question: String
    let answer: String
    
    init(flag: String, country: String) {
        question = flag
        answer = country 
    }
}
