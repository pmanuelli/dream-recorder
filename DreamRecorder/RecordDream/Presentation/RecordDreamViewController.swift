
import UIKit

protocol RecordDreamViewControllerDelegate: class {
    
}

class RecordDreamViewController: UIViewController {

    weak var delegate: RecordDreamViewControllerDelegate?
    
    lazy var mainView = RecordDreamView.loadNib()
    let viewModel = RecordDreamViewModel()
        
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        addButtonTargets()
    }
    
    private func bindViewModel() {
        viewModel.delegate = self
    }
    
    private func addButtonTargets() {
        mainView.recordButton.addTarget(self, action: #selector(recordButtonTouched), for: .touchUpInside)
    }
    
    @objc
    private func recordButtonTouched() {
        mainView.recordButtonTouchedUpInside()
        viewModel.recordButtonTouched()
    }
}

extension RecordDreamViewController: RecordDreamViewModelDelegate {

    func recordStarted() {

    }
    
    func recordStopped() {

    }
    
    func showSaveRecordButton() {
        mainView.showSaveRecordButton()
    }
    
    func hideSaveRecordButton() {
        mainView.hideSaveRecordButton()
    }
}
