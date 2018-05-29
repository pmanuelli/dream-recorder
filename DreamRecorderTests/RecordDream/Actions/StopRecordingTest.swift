
@testable import DreamRecorder

import XCTest

class StopRecordingTest: XCTestCase {
    
    func testWhenActionIsExecutedThenStopRecordingIsCalled() {
        
        let audioRecorder = givenAnAudioRecorder(returningOnStop: DummyAudioRecord())
        let action = givenAnAction(audioRecorder: audioRecorder)
        
        let audioRecordReturned = whenActionIsExecuted(action: action)
        
        assertStartRecordingIsCalledOnce(audioRecorder)
        assertAudioRecordReturned(audioRecordReturned, isTheOneReturnedBy: audioRecorder)
    }
    
    private func givenAnAudioRecorder(returningOnStop audioRecord: AudioRecord) -> SpyAudioRecorder {
        return SpyAudioRecorder(audioRecordToReturn: audioRecord)
    }
    
    private func givenAnAction(audioRecorder: AudioRecorder) -> StopRecording {
        return StopRecording(audioRecorder: audioRecorder)
    }
    
    private func whenActionIsExecuted(action: StopRecording) -> AudioRecord {
        return action.execute()
    }
    
    private func assertStartRecordingIsCalledOnce(_ audioRecorder: SpyAudioRecorder) {
        XCTAssertEqual(audioRecorder.stopRecordingCalls, 1)
    }
    
    private func assertAudioRecordReturned(_ recordReturned: AudioRecord, isTheOneReturnedBy recorder: SpyAudioRecorder) {
        
        let dummyRecordReturned = recordReturned as? DummyAudioRecord
        let dummyRecordExpected = recorder.audioRecordToReturn as? DummyAudioRecord
        
        XCTAssertNotNil(dummyRecordReturned)
        XCTAssertNotNil(dummyRecordExpected)
        XCTAssert(dummyRecordReturned === dummyRecordExpected)
    }
}

private class SpyAudioRecorder: AudioRecorder {
    
    let audioRecordToReturn: AudioRecord
    
    init(audioRecordToReturn: AudioRecord) {
        self.audioRecordToReturn = audioRecordToReturn
    }
    
    var startRecordingCalls = 0
    
    func startRecording() {
        startRecordingCalls += 1
    }
    
    var stopRecordingCalls = 0
    
    func stopRecording() -> AudioRecord {
        stopRecordingCalls += 1
        
        return audioRecordToReturn
    }
}

private class DummyAudioRecord: AudioRecord {
    
}
