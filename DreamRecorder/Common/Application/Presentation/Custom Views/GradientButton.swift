
import UIKit

@IBDesignable
class GradientButton: UIButton, HasGradient {
    
    override var cornerRadius: CGFloat {
        didSet { gradientView.cornerRadius = cornerRadius }
    }
    
    @IBInspectable
    var startColor: UIColor {
        get { return gradientView.startColor }
        set { gradientView.startColor = newValue }
    }
    
    @IBInspectable
    var startColorLocation: CGFloat {
        get { return gradientView.startColorLocation }
        set { gradientView.startColorLocation = newValue }
    }
    
    @IBInspectable
    var endColor: UIColor {
        get { return gradientView.endColor }
        set { gradientView.endColor = newValue }
    }
    
    @IBInspectable
    var endColorLocation: CGFloat {
        get { return gradientView.endColorLocation }
        set { gradientView.endColorLocation = newValue }
    }
    
    @IBInspectable
    var startPoint: CGPoint {
        get { return gradientView.startPoint }
        set { gradientView.startPoint = newValue }
    }
    
    @IBInspectable
    var endPoint: CGPoint {
        get { return gradientView.endPoint }
        set { gradientView.endPoint = newValue }
    }

    private let gradientView = GradientView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupGradientView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupGradientView()
    }
    
    private func setupGradientView() {
        addSubviewToBounds(gradientView)
    }
}
