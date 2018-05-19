
import UIKit
import RxSwift

protocol RecordDreamViewControllerDelegate: class {
    
}

class RecordDreamViewController: UIViewController {

    weak var delegate: RecordDreamViewControllerDelegate?
    
    lazy var mainView = RecordDreamView.loadNib()
    let viewModel = RecordDreamViewModel()
    
    let disposeBag = DisposeBag()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        addButtonTargets()
    }
    
    private func bindViewModel() {
        
        viewModel.continueButtonEnabled
            .asObservable()
            .subscribe(onNext: continueButtonEnabledChanged)
            .disposed(by: disposeBag)
    }
    
    private func addButtonTargets() {
        
        mainView.recordButton
            .addTarget(self, action: #selector(recordButtonTouched), for: .touchUpInside)
    }
    
    @objc
    private func recordButtonTouched() {
        mainView.animateRecordButtonTouch()
        
        viewModel.recordButtonTouched()
    }
    
    private func continueButtonEnabledChanged(_ isEnabled: Bool) {
        mainView.changeContinueButtonVisibility(isEnabled)
    }
}
