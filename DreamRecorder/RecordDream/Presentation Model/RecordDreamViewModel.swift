
import RxSwift

class RecordDreamViewModel {

    let recordButtonTitle = Variable<String>("Record")

    let continueButtonEnabled = Variable<Bool>(false)
    let continueButtonTitle = "Continue"

    let recordButtonTouch: AnyObserver<Void>
    private let recordButtonTouched: Observable<Void>
    
    private var startRecordingAction: StartRecording
    private var stopRecordingAction: StopRecording

    private var isRecording = false
    
    private let disposeBag = DisposeBag()

    init(startRecordingAction: StartRecording, stopRecordingAction: StopRecording) {
        
        self.startRecordingAction = startRecordingAction
        self.stopRecordingAction = stopRecordingAction
        
        let recordButtonTouchSubject = PublishSubject<Void>()
        self.recordButtonTouch = recordButtonTouchSubject.asObserver()
        self.recordButtonTouched = recordButtonTouchSubject.asObservable()
        
        observeRecordButtonTouched()
    }
    
    func observeRecordButtonTouched() {
        
        recordButtonTouched
            .subscribe(onNext: { [weak self] in self?.recordButtonWasTouched() })
            .disposed(by: disposeBag)
    }
    
    private func recordButtonWasTouched() {

        if isRecording {
            stopRecording()
        }
        else {
            startRecording()
        }
    }
    
    private func startRecording() {
        isRecording = true
        continueButtonEnabled.value = false
        recordButtonTitle.value = "Stop"
        
        startRecordingAction.execute()
    }
    
    private func stopRecording() {
        isRecording = false
        continueButtonEnabled.value = true
        recordButtonTitle.value = "New Record"
        
        stopRecordingAction.execute()
    }
}
