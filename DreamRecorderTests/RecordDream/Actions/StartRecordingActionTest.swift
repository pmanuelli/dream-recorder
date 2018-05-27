
@testable import DreamRecorder

import XCTest

class StartRecordingActionTest: XCTestCase {
    
    func testWhenActionIsExecutedThenStartRecordingIsCalled() {
        
        let audioRecorder = SpyAudioRecorder()
        let action = StartRecording()
        
        action.execute(audioRecorder: audioRecorder)
        
        XCTAssertEqual(audioRecorder.startRecordingCalls, 1)
    }
}

private class SpyAudioRecorder: AudioRecorder {
    
    var startRecordingCalls = 0
    
    func startRecording() {
        startRecordingCalls += 1
    }
    
    var stopRecordingCalls = 0
    
    func stopRecording() {
        stopRecordingCalls += 1
    }
}
