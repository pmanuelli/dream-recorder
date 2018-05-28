
@testable import DreamRecorder

import XCTest

class StartRecordingActionTest: XCTestCase {
    
    func testWhenActionIsExecutedThenStartRecordingIsCalled() {
        
        let audioRecorder = givenAnAudioRecorder()
        let action = givenAnAction()
        
        whenActionIsExecuted(action: action, audioRecorder: audioRecorder)
        
        assertStartRecordingIsCalledOnce(audioRecorder)
    }
    
    private func givenAnAudioRecorder() -> SpyAudioRecorder {
        return SpyAudioRecorder()
    }
    
    private func givenAnAction() -> StartRecording {
        return StartRecording()
    }
    
    private func whenActionIsExecuted(action: StartRecording, audioRecorder: AudioRecorder) {
        action.execute(audioRecorder: audioRecorder)
    }
    
    private func assertStartRecordingIsCalledOnce(_ audioRecorder: SpyAudioRecorder) {
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
