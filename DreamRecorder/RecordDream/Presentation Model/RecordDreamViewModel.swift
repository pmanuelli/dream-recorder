
import RxSwift

class RecordDreamViewModel {

    let recordButtonTitle = Variable<String>("Tap to Record")
    
    let continueButtonEnabled = Variable<Bool>(false)
    let continueButtonTitle = "Continue"
    
    private var startRecordingAction = StartRecording()
    private var stopRecordingAction = StopRecording()
    
    private var isRecording = false
    
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
        
        startRecordingAction.execute()
    }
    
    private func stopRecording() {
        isRecording = false
        continueButtonEnabled.value = true
        
        stopRecordingAction.execute()
    }
}
