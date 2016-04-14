//
//  ColorController.swift
//  ColorTransition
//
//  Created by Pietro Ribeiro Pepe on 4/14/16.
//  Copyright © 2016 Pietro Ribeiro Pepe. All rights reserved.
//

import UIKit

class ColorController : UIViewController{
    
    var shapeTransition : ShapeTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let b = UIButton()
        b.frame.size = CGSizeMake(200,200)
        b.backgroundColor = UIColor.whiteColor()
        b.center = view.center
        b.addTarget(self, action: "back", forControlEvents: .TouchUpInside)
        view.addSubview(b)
    }
    
    func back(){
        shapeTransition.transitionBack { () -> Void in
            self.shapeTransition = nil // não esquecerrrr pelamordedeus
        }
    }
}