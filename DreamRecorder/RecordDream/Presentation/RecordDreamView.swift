
import UIKit

class RecordDreamView: UIView {
    
    @IBOutlet var recordButtonContainer: GradientView!
    @IBOutlet var recordButton: UIButton!
    
    @IBOutlet var saveRecordButtonContainer: GradientView!
    @IBOutlet var saveRecordButton: UIButton!
    
    var touchAnimator: TouchUpInsideAnimator!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func animateRecordButtonTouch() {
        touchAnimator = TouchUpInsideAnimator(view: recordButtonContainer)
        touchAnimator.animate(completion: nil)
    }
    
    func changeSaveRecordButtonVisibility(_ isVisible: Bool) {
        saveRecordButtonContainer.isHidden = !isVisible
    }
}
