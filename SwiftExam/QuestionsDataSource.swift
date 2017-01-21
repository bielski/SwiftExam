//
//  QuestionsDataSource.swift
//  SwiftExam
//
//  Created by ewa on 08.01.2017.
//  Copyright © 2017 Ewa Bielska. All rights reserved.
//

import Foundation

struct QuestionsDataSource {
    
    static var questions: [String] = [
        "What is an optional and what problem do optionals solve?",
        "When should you use a structure, and when should you use a class?",
        "What are generics and what problem do they solve?",
        "There are a few cases when you can't avoid using implicitly unwrapped optionals. When? Why?",
        "What are the various ways to unwrap an optional? How do they rate in terms of safety? Hint: There are at least seven ways.",
        "Is Swift an object-oriented language or a functional language?",
        "Consider the following code: \n\nvar array1 = [1, 2, 3, 4, 5] \nvar array2 = array1 \narray2.append(6) \nvar len = array1.count \n\nWhats the value of the len variable, and why?",
        "In Swift enumerations, what’s the difference between raw values and associated values?",
        "What does ViewController is responsible for?",
        "Describe memory managment in Swift?",
        "What is a difference between designated and convenienve initializer?",
        "Why guard is better than if?"
    ]
}
