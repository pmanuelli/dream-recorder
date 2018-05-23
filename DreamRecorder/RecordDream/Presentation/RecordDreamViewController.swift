
import UIKit
import RxSwift
import RxCocoa

class RecordDreamViewController: UIViewController {
    
    lazy var mainView = RecordDreamView.loadNib()
    let viewModel: RecordDreamViewModel
    
    let disposeBag = DisposeBag()
    
    init(viewModel: RecordDreamViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: .none, bundle: .none)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
    }
    
    private func bindViewModel() {
        
        viewModel.recordButtonTitle
            .asObservable()
            .bind(to: mainView.recordButton.rx.title())
            .disposed(by: disposeBag)
        
        viewModel.continueButtonEnabled
            .asObservable()
            .subscribe(onNext: { [weak self] isEnabled in self?.continueButtonEnabledChanged(isEnabled) })
            .disposed(by: disposeBag)
        
        mainView.recordButton.rx.tap
            .do(onNext: { [weak self] _ in self?.mainView.animateRecordButtonTouch() })
            .bind(to: viewModel.recordButtonTouch)
            .disposed(by: disposeBag)
        
        mainView.continueButton.setTitle(viewModel.continueButtonTitle)
    }
        
    private func continueButtonEnabledChanged(_ isEnabled: Bool) {
        mainView.changeContinueButtonVisibility(isEnabled)
    }
}
