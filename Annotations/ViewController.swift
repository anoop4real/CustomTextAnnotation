//
//  ViewController.swift
//  Annotations
//
//  Created by anoopm on 04/12/17.
//  Copyright © 2017 anoopm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var annotationView:AnnotationView!
    var annotationArray = [Annotation]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let ann1 = Annotation(annotationCenter: CGPoint(x:250.0,y:370.0), annotationText: "Its time to play the game", annotationStrokeColor: UIColor.red, annotationFont: UIFont.boldSystemFont(ofSize: 6.0), annotationTextColor: UIColor.blue, annotationFillColor:UIColor.green)
        let ann2 = Annotation(annotationCenter: CGPoint(x:150.0,y:70.0), annotationText: "Deadman walking", annotationStrokeColor: UIColor.green, annotationFont: UIFont.boldSystemFont(ofSize: 9.0), annotationTextColor: UIColor.blue, annotationFillColor:UIColor.red)
        let ann3 = Annotation(annotationCenter: CGPoint(x:80.0,y:170.0), annotationText: "You cant see me", annotationStrokeColor: UIColor.cyan, annotationFont: UIFont.boldSystemFont(ofSize: 15.0), annotationTextColor: UIColor.blue,annotationFillColor:UIColor.cyan)
        let ann4 = Annotation(annotationCenter: CGPoint(x:250.0,y:70.0), annotationText: "I am trouble", annotationStrokeColor: UIColor.gray, annotationFont: UIFont.boldSystemFont(ofSize: 11.0), annotationTextColor: UIColor.black,annotationFillColor:UIColor.yellow)
        let ann5 = Annotation(annotationCenter: CGPoint(x:150.0,y:270.0), annotationText: "I lie I cheat I steal", annotationStrokeColor: UIColor.red, annotationFont: UIFont.boldSystemFont(ofSize: 6.0), annotationTextColor: UIColor.blue, annotationFillColor:UIColor.lightText)
        let ann6 = Annotation(annotationCenter: CGPoint(x:80.0,y:370.0), annotationText: "Loose Control!!", annotationStrokeColor: UIColor.red, annotationFont: UIFont.boldSystemFont(ofSize: 18.0), annotationTextColor: UIColor.darkGray, annotationFillColor:UIColor.magenta)
        let ann7 = Annotation(annotationCenter: CGPoint(x:120.0,y:450.0), annotationText: "I AM STRONG!!", annotationStrokeColor: UIColor.red, annotationFont: UIFont.boldSystemFont(ofSize: 18.0), annotationTextColor: UIColor.yellow, annotationFillColor:UIColor.lightGray)
        let ann8 = Annotation(annotationCenter: CGPoint(x:140.0,y:550.0), annotationText: "I AM CUSTOM!!", annotationStrokeColor: UIColor.red, annotationFont: UIFont.boldSystemFont(ofSize: 22.0), annotationTextColor: UIColor.yellow, annotationFillColor:UIColor.lightGray)
        annotationArray.append(ann1)
        annotationArray.append(ann2)
        annotationArray.append(ann3)
        annotationArray.append(ann4)
        annotationArray.append(ann5)
        annotationArray.append(ann6)
        annotationArray.append(ann7)
        annotationArray.append(ann8)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        annotationView.setUpAnnotationWith(annotations: annotationArray)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

