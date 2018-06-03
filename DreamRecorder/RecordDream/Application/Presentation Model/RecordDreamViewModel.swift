
import RxSwift

class RecordDreamViewModel {

    let recordButtonTitle = Variable<String>("Record")
    let recordButtonTouch: AnyObserver<Void>

    let continueButtonEnabled = Variable<Bool>(false)
    let continueButtonTitle = "Continue"
    let continueButtonTouch: AnyObserver<Void>
    
    let audioRecordAvailable: Observable<AudioRecord>

    private let recordButtonTouchSubject = PublishSubject<Void>()
    private let continueButtonTouchSubject = PublishSubject<Void>()
    private let audioRecordAvailableSubject = PublishSubject<AudioRecord>()
    
    private let disposeBag = DisposeBag()
    
    private let startRecordingAction: StartRecording
    private let stopRecordingAction: StopRecording

    private var isRecording = false
    private var currentAudioRecord: AudioRecord?
    
    init(startRecordingAction: StartRecording, stopRecordingAction: StopRecording) {
        
        self.startRecordingAction = startRecordingAction
        self.stopRecordingAction = stopRecordingAction
        
        self.recordButtonTouch = recordButtonTouchSubject.asObserver()
        self.continueButtonTouch = continueButtonTouchSubject.asObserver()
        self.audioRecordAvailable = audioRecordAvailableSubject
        
        observeRecordButtonTouchSubject()
        observeContinueButtonTouchSubject()
    }
    
    private func observeRecordButtonTouchSubject() {
        
        recordButtonTouchSubject
            .subscribe(onNext: { [weak self] in self?.recordButtonTouched() })
            .disposed(by: disposeBag)
    }
    
    private func observeContinueButtonTouchSubject() {
        
        continueButtonTouchSubject
            .subscribe(onNext: { [weak self] in self?.continueButtonTouched() })
            .disposed(by: disposeBag)
    }
    
    private func recordButtonTouched() {

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
        
        currentAudioRecord = stopRecordingAction.execute()
    }
    
    private func continueButtonTouched() {
        guard let currentAudioRecord = currentAudioRecord else {
            return
        }
        
        audioRecordAvailableSubject.onNext(currentAudioRecord)
    }
}
