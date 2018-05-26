
import UIKit
import RxSwift

class RecordDreamCoordinator: BaseCoordinator<Void> {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() -> Observable<Void> {
    
        let viewModel = createViewModel()
        let controller = createViewController(viewModel: viewModel)
        
        navigationController.pushViewController(controller, animated: true)
        
        return Observable.never()
    }
    
    private func createViewModel() -> RecordDreamViewModel {
        
        let startRecording = StartRecording()
        let stopRecording = StopRecording()
        
        return RecordDreamViewModel(startRecordingAction: startRecording,
                                    stopRecordingAction: stopRecording)
    }
    
    private func createViewController(viewModel: RecordDreamViewModel) -> UIViewController {
        return RecordDreamViewController(viewModel: viewModel)
    }
}
