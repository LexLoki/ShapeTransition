//
//  ViewController.swift
//  ColorTransition
//
//  Created by Pietro Ribeiro Pepe on 4/14/16.
//  Copyright © 2016 Pietro Ribeiro Pepe. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let s = 0.2*view.frame.size.width
        let h = 0.4*view.frame.size.width
        // Do any additional setup after loading the view, typically from a nib.
        let b1 = UIButton()
        setProperties(b1,UIColor.redColor(), s)
        b1.makeCircle()
        b1.center = CGPointMake(0.25*view.frame.width, h)
        let b2 = TriangleButton()
        setProperties(b2, UIColor.blueColor(), s)
        b2.center = CGPointMake(0.5*view.frame.width, h)
        let b3 = UIButton()
        setProperties(b3, UIColor.orangeColor(), s)
        b3.center = CGPointMake(0.75*view.frame.width, h)
    }
    
    func setProperties(b : UIButton, _ color : UIColor, _ size : CGFloat)->UIButton{
        b.backgroundColor = color
        b.frame.size = CGSizeMake(size,size)
        b.addTarget(self, action: "transition:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(b)
        return b
    }
    
    func transition(button : UIButton){
        let newVC = ColorController()
        let st = ShapeTransition(fromViewController: self, toViewController: newVC)
        st.changesBackgroundColor = true
        newVC.shapeTransition = st
        st.transitionForward(button,completion: nil)
    }
}

extension UIView{
    public func makeCircle(){
        layer.cornerRadius = frame.height/2;
        layer.masksToBounds = true;
    }
}