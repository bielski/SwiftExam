//
//  ViewController.swift
//  SwiftExam
//
//  Created by ewa on 08.01.2017.
//  Copyright © 2017 Ewa Bielska. All rights reserved.
//

import UIKit
import iCarousel

class ViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {
    
    var carouselItems = QuestionsDataSource.questions
    
    @IBOutlet var carousel: iCarousel!
    var selectedQuestionIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup(of: carousel)
    }
    
    // MARK: Carousel delegate methods
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return carouselItems.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var itemView: UIImageView
        var itemLabel: UILabel

        if let view = view as? UIImageView {
            itemView = view
            //get a reference to the label in the recycled view
            itemLabel = itemView.viewWithTag(1) as! UILabel
        } else {
            itemView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
            itemLabel = UILabel(frame: itemView.bounds)
            
            setup(of: itemView, with: itemLabel)
        }
        itemLabel.text = "\(index+1)"

        return itemView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if (option == .spacing) {
            return value * 1.1
        }
        return value
    }
    
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        selectedQuestionIndex = index
        performSegue(withIdentifier: "question", sender: self)
    }
    
    // MARK: Prepare for segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "question") {
            let questionController = segue.destination as! QuestionViewController
            questionController.questionNumber = selectedQuestionIndex!
        }
    }
    
    // MARK: Private methods
    
    func setup(of carousel: iCarousel) {
        carousel.type = .coverFlow2
        carousel.backgroundColor = nil
    }
    
    func setup(of itemView: UIImageView, with label: UILabel) {
        itemView.backgroundColor = UIColor.white
        itemView.alpha = 0.95
        itemView.contentMode = .center
        
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 50)
        label.textColor = UIColor.darkGray
        label.tag = 1
        
        itemView.addSubview(label)
    }
}
