
import UIKit

class SaveRecordedDreamViewController: UIViewController {

    lazy var mainView = SaveRecordedDreamView.loadNib()
    
    override func loadView() {
        view = mainView
    }
}
