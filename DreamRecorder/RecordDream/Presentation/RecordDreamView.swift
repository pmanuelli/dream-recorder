
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
    
    func recordButtonTouchedUpInside() {
        touchAnimator = TouchUpInsideAnimator(view: recordButtonContainer)
        touchAnimator.animate(completion: nil)
    }
    
    func showSaveRecordButton() {
        saveRecordButtonContainer.isHidden = false
    }
    
    func hideSaveRecordButton() {
        saveRecordButtonContainer.isHidden = true
    }
}
