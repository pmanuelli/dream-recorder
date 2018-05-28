
class StartRecording {

    let audioRecorder: AudioRecorder
    
    init(audioRecorder: AudioRecorder) {
        self.audioRecorder = audioRecorder
    }
    
    func execute() {
        
        audioRecorder.startRecording()
    }
}
