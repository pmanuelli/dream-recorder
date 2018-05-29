
class StopRecording {

    let audioRecorder: AudioRecorder
    
    init(audioRecorder: AudioRecorder) {
        self.audioRecorder = audioRecorder
    }
    
    func execute() -> AudioRecord {
        
        return audioRecorder.stopRecording()
    }
}
