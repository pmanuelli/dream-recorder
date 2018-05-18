
import UIKit

protocol HasGradient {
    
    var startColor: UIColor { get set }
    var startColorLocation: CGFloat { get set }
    
    var endColor: UIColor { get set }
    var endColorLocation: CGFloat { get set }
    
    var startPoint: CGPoint { get set }
    var endPoint: CGPoint { get set }
}

@IBDesignable
class GradientView: UIView, HasGradient {
    
    @IBInspectable
    var startColor: UIColor = .blue {
        didSet { setNeedsLayout() }
    }
    
    @IBInspectable
    var startColorLocation: CGFloat = 0 {
        didSet { setNeedsLayout() }
    }
    
    @IBInspectable
    var endColor: UIColor = .purple {
        didSet { setNeedsLayout() }
    }
    
    @IBInspectable
    var endColorLocation: CGFloat = 1 {
        didSet { setNeedsLayout() }
    }
    
    @IBInspectable
    var startPoint: CGPoint = CGPoint(x: 0.5, y: 0) {
        didSet { setNeedsLayout() }
    }
    
    @IBInspectable
    var endPoint: CGPoint = CGPoint(x: 0.5, y: 1) {
        didSet { setNeedsLayout() }
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    private var gradientLayer: CAGradientLayer!
    
    override func layoutSubviews() {
        gradientLayer = self.layer as! CAGradientLayer
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.locations = [startColorLocation, endColorLocation].map { NSNumber(value: Float($0)) }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
    }
    
//    func animate(duration: TimeInterval, newTopColor: UIColor, newBottomColor: UIColor) {
//        let fromColors = self.gradientLayer?.colors
//        let toColors: [AnyObject] = [ newTopColor.cgColor, newBottomColor.cgColor]
//        self.gradientLayer?.colors = toColors
//        let animation : CABasicAnimation = CABasicAnimation(keyPath: "colors")
//        animation.fromValue = fromColors
//        animation.toValue = toColors
//        animation.duration = duration
//        animation.isRemovedOnCompletion = true
//        animation.fillMode = kCAFillModeForwards
//        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
//        self.gradientLayer?.add(animation, forKey:"animateGradient")
//    }
}
