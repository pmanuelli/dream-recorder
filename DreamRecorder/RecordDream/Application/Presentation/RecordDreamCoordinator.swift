
import UIKit
import RxSwift

class RecordDreamCoordinator: BaseCoordinator<Void> {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() -> Observable<Void> {
    
        pushRecordDreamViewController()

        return Observable.never()
    }
    
    private func pushRecordDreamViewController() {
        
        let viewModel = createRecordDreamViewModel()
        subscribe(to: viewModel)
        
        let controller = createRecordDreamViewController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func createRecordDreamViewModel() -> RecordDreamViewModel {
        
        let audioRecorder = DefaultAudioRecorder()
        let startRecording = StartRecording(audioRecorder: audioRecorder)
        let stopRecording = StopRecording(audioRecorder: audioRecorder)
        
        return RecordDreamViewModel(startRecordingAction: startRecording,
                                    stopRecordingAction: stopRecording)
    }
    
    private func subscribe(to viewModel: RecordDreamViewModel) {
        
        viewModel.audioRecordAvailable
            .subscribe(onNext: { [weak self] audioRecord in self?.pushSaveRecordedDreamViewController(recordedDream: audioRecord) })
            .disposed(by: disposeBag)
    }
    
    private func createRecordDreamViewController(viewModel: RecordDreamViewModel) -> UIViewController {
        return RecordDreamViewController(viewModel: viewModel)
    }
    
    private func pushSaveRecordedDreamViewController(recordedDream: AudioRecord) {
        
        let controller = createSaveRecordedDreamViewController(recordedDream: recordedDream)
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func createSaveRecordedDreamViewController(recordedDream: AudioRecord) -> SaveRecordedDreamViewController {
        return SaveRecordedDreamViewController(nibName: .none, bundle: .none)
    }
}
