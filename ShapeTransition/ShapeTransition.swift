//
//  ShapeTransition.swift
//  ColorTransition
//
//  Created by Pietro Ribeiro Pepe on 4/14/16.
//  Copyright © 2016 Pietro Ribeiro Pepe. All rights reserved.
//

import UIKit

/**
 This class makes a custom transition that enlarges and (optionally) rotates a given view until it covers the screen and then present a view controller
 The shapeTransition object created needs to be used by the presented viewController to transitionBack. If you store it be careful to treat the reference as weak or set it to nil after transitioning back, to avoid retain cycles
*/
class ShapeTransition{
    private var destination : UIViewController!
    /// The ViewController that is/will be presented
    weak var fromVC : UIViewController!
    /// The ViewController that is/will present another ViewController
    weak var toVC : UIViewController!
    /// Informs if the animation should set the color of the destination ViewController's view's background to be the background color of the view
    var changesBackgroundColor = false
    /// Informs how much the view should rotate
    var rotation : CGFloat = 0
    /// The duration of the transition animation
    var transitionTime : NSTimeInterval = 0.6
    /// The view on the source viewController that is going to enlarge
    private weak var view : UIView!
    private var originalZpos : CGFloat!
    
    /**
     * Creates a new ShapeTransition between the two given viewController's
     *
     * - Parameter fromViewController: the ViewController to transition from
     * - Parameter toViewController: the ViewController to transition to
    */
    init(fromViewController : UIViewController, toViewController : UIViewController){
        fromVC = fromViewController
        toVC = toViewController
    }
    
    /**
     * Performs the transition animation, using a specific UIView to enlarge
     *
     * - Parameter view: the UIView to be enlarged
     * - Parameter completion: a block to be run when the transition is completed
    */
    func transitionForward(view : UIView, completion : (()->Void)? = {()->Void in}){
        self.view = view
        if changesBackgroundColor{
            toVC.view.backgroundColor = view.backgroundColor
        }
        let sx = toVC.view.frame.size.width*2.4/view.frame.size.width
        let sy = toVC.view.frame.size.height*2.4/view.frame.size.height
        let s = sx>sy ? sx : sy
        destination = toVC
        originalZpos = view.layer.zPosition
        view.layer.zPosition = 100000
        UIView.animateWithDuration(self.transitionTime, animations: { () -> Void in
            view.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(s, s), self.rotation)
            }) { (_) -> Void in
                self.fromVC.presentViewController(self.destination, animated: false, completion: { () -> Void in
                    self.toVC = self.destination
                    self.destination = nil
                    completion?()
                })
        }
    }
    /**
     * Performs the transition animation backwards, when going back from the destination ViewController to the source ViewController
     *
     * - Parameter completion: a block to be run when the transition is completed
     */
    func transitionBack(completion : (()->Void)? = {()->Void in}){
        toVC.dismissViewControllerAnimated(false) { () -> Void in
            UIView.animateWithDuration(self.transitionTime, animations: { () -> Void in
                self.view.transform = CGAffineTransformMakeScale(1, 1)
                }, completion: { (_) -> Void in
                    self.view.layer.zPosition = self.originalZpos
                    completion?()
            })
        }
    }
}