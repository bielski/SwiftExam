//
//  QuestionViewController.swift
//  SwiftExam
//
//  Created by ewa on 08.01.2017.
//  Copyright © 2017 Ewa Bielska. All rights reserved.
//

import UIKit

class QuestionViewController: ViewController {
    
    @IBOutlet var questionText: UITextView!
    var questionNumber: Int = 0
    
    override func viewDidLoad() {
        displayQuestionText()
    }
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: private function
    
    private func displayQuestionText() {
        questionText.text = QuestionsDataSource.questions[questionNumber]
    }
}
