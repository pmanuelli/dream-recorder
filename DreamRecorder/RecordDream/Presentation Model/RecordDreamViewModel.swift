
import RxSwift

class RecordDreamViewModel {

    let recordButtonTitle = Variable<String>("Record")

    let continueButtonEnabled = Variable<Bool>(false)
    let continueButtonTitle = "Continue"

    private var startRecordingAction: StartRecording
    private var stopRecordingAction: StopRecording

    private var isRecording = false

    init(startRecordingAction: StartRecording, stopRecordingAction: StopRecording) {
        self.startRecordingAction = startRecordingAction
        self.stopRecordingAction = stopRecordingAction
    }
    
    func recordButtonTouched() {
        
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
