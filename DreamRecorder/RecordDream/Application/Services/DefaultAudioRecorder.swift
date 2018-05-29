
class DefaultAudioRecorder: AudioRecorder {
    
    func startRecording() {
        
    }
    
    func stopRecording() -> AudioRecord {
        return DefaultAudioRecord()
    }
}
