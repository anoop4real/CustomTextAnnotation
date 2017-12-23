//
//  AnnotationView.swift
//  Annotations
//
//  Created by anoopm on 04/12/17.
//  Copyright © 2017 anoopm. All rights reserved.
//

import UIKit

class AnnotationView: UIView {

    var annotations:[Annotation] = []
    let offsetHeight:CGFloat = 23.0
    let offsetWidth:CGFloat = 10.0
    let offsetHeight2:CGFloat = 10.0
    let offsetX:CGFloat = 10.0
    let offsetY:CGFloat = 13.0
    func setUpAnnotationWith(annotations: [Annotation]){
        
        self.annotations = annotations
        self.setNeedsDisplay()
    }
    func textSizeFor(annotation: Annotation)-> CGSize{
        
        let attributes = self.attributesFor(annotation: annotation)
        let textToDisplay = annotation.annotationText!
        let textSize: CGSize = textToDisplay.size(withAttributes: attributes)
        return textSize

    }
    func attributesFor(annotation:Annotation) -> [NSAttributedStringKey : Any]{
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let attr = [NSAttributedStringKey.font: annotation.annotationFont, NSAttributedStringKey.paragraphStyle: paragraphStyle, NSAttributedStringKey.foregroundColor: annotation.annotationTextColor] as [NSAttributedStringKey : Any]
        return attr
    }
//    func animateAnnotation(duration: TimeInterval, layer:CAShapeLayer) {
//
//        let animation = CABasicAnimation(keyPath: "strokeEnd")
//
//        // Set the animation duration appropriately
//        animation.duration = duration
//
//        animation.fromValue = 0
//        animation.toValue = 1
//
//        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
//        layer.strokeEnd = 1.0
//        // Do the actual animation
//        layer.add(animation, forKey: "animateAnnotation")
//    }

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        for annotation in self.annotations{
            // Find the text size with the given attributes
            let size = textSizeFor(annotation: annotation)

            // Find the path for border for the text.
            drawAnnotationRect(from: annotation.annotationCenter, withTextSize: size, forAnnotation: annotation)
//            let shapeLayer = CAShapeLayer()
//            shapeLayer.path = path.cgPath
//            shapeLayer.strokeColor = annotation.annotationStrokeColor.cgColor
//            shapeLayer.fillColor = UIColor.gray.cgColor
//            shapeLayer.lineWidth = 2.0
//
//            shapeLayer.strokeEnd = 0.0
//            self.layer.addSublayer(shapeLayer)
            // Draw the text
            let annotationRect = CGRect(x: (annotation.annotationCenter.x - (size.width / 2.0 + 10.0)), y: annotation.annotationCenter.y - (size.height + offsetHeight), width: size.width + 20.0, height: size.height + offsetHeight2)
            annotation.annotationText.draw(in: annotationRect.insetBy(dx: 10.0, dy: 5.0), withAttributes: attributesFor(annotation: annotation))
            
//            let textLayer = CATextLayer()
//            textLayer.frame = annotationRect.insetBy(dx: 10.0, dy: 5.0)
//            textLayer.string = annotation.annotationText
//            textLayer.foregroundColor = annotation.annotationTextColor.cgColor
//            textLayer.font = UIFont.systemFont(ofSize: 6, weight: UIFont.Weight.medium)
//            textLayer.isWrapped = true
//            textLayer.alignmentMode = kCAAlignmentLeft
//            textLayer.contentsScale = UIScreen.main.scale
//            self.layer.addSublayer(textLayer)
            
//            animateAnnotation(duration: 3.0, layer: shapeLayer)
            

        }
    }


    func drawAnnotationRect(from annotationCentre: CGPoint, withTextSize textSize: CGSize ,forAnnotation annotation:Annotation) {
         let fillColor = annotation.annotationFillColor!
        fillColor.setFill()
        let borderPath = UIBezierPath()
        // Draw a triangular shape and box around the texts
        borderPath.move(to: CGPoint(x: annotationCentre.x, y: annotationCentre.y))
        borderPath.addLine(to: CGPoint(x: (annotationCentre.x + offsetX), y: annotationCentre.y - offsetY))
        borderPath.addLine(to: CGPoint(x: (annotationCentre.x + (textSize.width / 2.0 + offsetWidth)), y: annotationCentre.y - offsetY))
        borderPath.addLine(to: CGPoint(x: (annotationCentre.x + (textSize.width / 2.0 + offsetWidth)), y: annotationCentre.y - (textSize.height + offsetHeight)))
        borderPath.addLine(to: CGPoint(x: (annotationCentre.x - (textSize.width / 2.0 + offsetWidth)), y: annotationCentre.y - (textSize.height + offsetHeight)))
        borderPath.addLine(to: CGPoint(x: (annotationCentre.x - (textSize.width / 2.0 + offsetWidth)), y: annotationCentre.y - offsetY))
        borderPath.addLine(to: CGPoint(x: (annotationCentre.x - offsetX), y: annotationCentre.y - offsetY))
        borderPath.close()
        borderPath.stroke()
        borderPath.fill()

    }
}
