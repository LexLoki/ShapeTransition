# ShapeTransition
This class performs this custom transition between UIViewController's:

![alt tag](https://cloud.githubusercontent.com/assets/9408934/14547179/6af5364e-0281-11e6-9fa7-774664f0c578.gif)

It enlarges and (optionally) rotates a given view until it covers the screen and then present a view controller
 The shapeTransition object created needs to be used by the presented viewController to transitionBack. If you store it be careful to treat the reference as weak or set it to nil after transitioning back, to avoid retain cycles.
 
 ## Methods
* `func transitionForward(view : UIView)`
* `func transitionForward(view : UIView, completion : (()->Void)?)`
* `func transitionBack()`
* `func transitionBack(completion : (()->Void)?)`

## How to use + Example
Just move the ShapeTransition file to your project. When transitioning, instanciate a new ShapeTransition object, passing the controllers that are part of the transition. The example of the gif is available in this rep. Check the files: `ViewController` and `ColorController`.
