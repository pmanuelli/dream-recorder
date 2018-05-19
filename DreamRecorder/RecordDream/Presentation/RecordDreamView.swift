
import UIKit

class RecordDreamView: UIView {
    
    @IBOutlet var recordButtonContainer: GradientView!
    @IBOutlet var recordButton: UIButton!
    
    @IBOutlet var continueButtonContainer: GradientView!
    @IBOutlet var continueButton: UIButton!
    
    var touchAnimator: TouchUpInsideAnimator!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func animateRecordButtonTouch() {
        touchAnimator = TouchUpInsideAnimator(view: recordButtonContainer)
        touchAnimator.animate(completion: nil)
    }
    
    func changeContinueButtonVisibility(_ isVisible: Bool) {
        continueButtonContainer.isHidden = !isVisible
    }
}
