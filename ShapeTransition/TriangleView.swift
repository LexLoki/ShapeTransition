//
//  TriangleView.swift
//  ColorTransition
//
//  Created by Pietro Ribeiro Pepe on 4/14/16.
//  Copyright © 2016 Pietro Ribeiro Pepe. All rights reserved.
//

import UIKit

class TriangleButton: UIButton{
    override func drawRect(rect: CGRect) {
        // Get Height and Width
        let layerHeight = self.layer.frame.height
        let layerWidth = self.layer.frame.width
        
        // Create Path
        let bezierPath = UIBezierPath()
        
        // Draw Points
        bezierPath.moveToPoint(CGPointMake(0, layerHeight))
        bezierPath.addLineToPoint(CGPointMake(layerWidth, layerHeight))
        bezierPath.addLineToPoint(CGPointMake(layerWidth/2, 0))
        bezierPath.addLineToPoint(CGPointMake(0, layerHeight))
        bezierPath.closePath()
        
        // Apply Color
        //bezierPath.fill()
        
        // Mask to Path
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = bezierPath.CGPath
        self.layer.mask = shapeLayer
        
    }
    
}