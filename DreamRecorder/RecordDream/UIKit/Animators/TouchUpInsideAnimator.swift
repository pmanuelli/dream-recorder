
import UIKit

class TouchUpInsideAnimator: NSObject {

    let view: UIView
    
    init(view: UIView) {
        self.view = view
    }
    
    func animate(completion: (() -> Void)? ) {
        
        let data = [UIView.AnimateTransformData(transform: CGAffineTransform(scale: 0.95), duration: 0.2),
                    UIView.AnimateTransformData(transform: CGAffineTransform(scale: 1.05), duration: 0.2),
                    UIView.AnimateTransformData(transform: .identity, duration: 0.1)]
        
        UIView.animate(view, data: data, completion: completion)
    }
}
