
import RxSwift

class RecordDreamViewModel {

    let saveRecordButtonEnabled = Variable<Bool>(false)
    
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
        saveRecordButtonEnabled.value = false
        
        startRecordingAction.execute()
    }
    
    private func stopRecording() {
        isRecording = false
        saveRecordButtonEnabled.value = true
        
        stopRecordingAction.execute()
    }
}
