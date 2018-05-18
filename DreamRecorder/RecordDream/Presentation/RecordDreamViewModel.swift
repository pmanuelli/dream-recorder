
class RecordDreamViewModel {

    weak var delegate: RecordDreamViewModelDelegate?
    
    private var isRecording = false
    
    private var startRecordingAction = StartRecording()
    private var stopRecordingAction = StopRecording()
    
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
        startRecordingAction.execute()
        
        delegate?.recordStarted()
        delegate?.hideSaveRecordButton()
    }
    
    private func stopRecording() {
        isRecording = false
        stopRecordingAction.execute()
        
        delegate?.recordStopped()
        delegate?.showSaveRecordButton()
    }
}
