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
    
    var items: [Int] = []
    
    @IBOutlet var carousel: iCarousel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in 1 ... 20 {
            items.append(i)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carousel.type = .coverFlow2
        carousel.backgroundColor = nil
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return items.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        var itemView: UIImageView

        if let view = view as? UIImageView {
            itemView = view
            //get a reference to the label in the recycled view
            label = itemView.viewWithTag(1) as! UILabel
        } else {
            //don't do anything specific to the index within
            //this `if ... else` statement because the view will be
            //recycled and used with other index values later
            itemView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
            itemView.backgroundColor = UIColor.white
            itemView.alpha = 0.8
            //itemView.image = UIImage(named: "page.png")
            itemView.contentMode = .center

            label = UILabel(frame: itemView.bounds)
            label.backgroundColor = .clear
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 50)
            //label.font = label.font.withSize(50)
            label.textColor = UIColor.darkGray
            label.tag = 1
            itemView.addSubview(label)
        }

        //set item label
        //remember to always set any properties of your carousel item
        //views outside of the `if (view == nil) {...}` check otherwise
        //you'll get weird issues with carousel item content appearing
        //in the wrong place in the carousel
        label.text = "\(items[index])"

        return itemView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if (option == .spacing) {
            return value * 1.1
        }
        return value
    }
    
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        performSegue(withIdentifier: "question", sender: self)
    }
}
