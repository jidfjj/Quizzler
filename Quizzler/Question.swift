//
//  Question.swift
//  Quizzler
//
//  Created by 🐔同学 on 2021/04/11.
//  Copyright © 2021 rongcosme. All rights reserved.
//

import Foundation

class Question{
    
    let answer: Bool
    let questionText: String
    
    init(_ text: String, _ correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}
