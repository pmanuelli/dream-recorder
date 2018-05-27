
@testable import DreamRecorder

import XCTest
import RxSwift

class RecordDreamViewModelTest: XCTestCase {
    
    func testWhenViewModelIsCreatedThenContinueButtonIsDisabled() {
        
        let viewModel = givenAViewModel()
        
        assertContinueButtonIsDisabled(viewModel)
    }
    
    func testWhenRecordButtonIsTouchedOnceThenContinueButtonIsDisabled() {
        
        let viewModel = givenAViewModel()
        
        whenRecordButtonIsTouched(viewModel: viewModel)
        
        assertContinueButtonIsDisabled(viewModel)
    }
    
    
    func testWhenRecordButtonIsTouchedOnceThenStartRecordingActionIsExecuted() {
        
        let startRecording = SpyStartRecording()
        let viewModel = givenAViewModel(startRecordingAction: startRecording)
        
        whenRecordButtonIsTouched(viewModel: viewModel)
        
        assertActionIsExecutedOnce(startRecording)
    }
    
    func testWhenRecordButtonIsTouchedTwiceThenContinueButtonIsEnabled() {
        
        let viewModel = givenAViewModel()
        
        whenRecordButtonIsTouchedTwice(viewModel: viewModel)
        
        assertContinueButtonIsEnabled(viewModel)
    }
    
    func testWhenRecordButtonIsTouchedTwiceThenStopRecordingActionIsExecuted() {
        
        let stopRecording = SpyStopRecording()
        let viewModel = givenAViewModel(stopRecordingAction: stopRecording)
        
        whenRecordButtonIsTouchedTwice(viewModel: viewModel)
        
        assertActionIsExecutedOnce(stopRecording)
    }
    
    private func givenAViewModel() -> RecordDreamViewModel {
        return RecordDreamViewModel(startRecordingAction: StartRecording(),
                                    stopRecordingAction: StopRecording())
    }
    
    private func givenAViewModel(startRecordingAction: StartRecording) -> RecordDreamViewModel {
        return RecordDreamViewModel(startRecordingAction: startRecordingAction,
                                    stopRecordingAction: StopRecording())
    }
    
    private func givenAViewModel(stopRecordingAction: StopRecording) -> RecordDreamViewModel {
        return RecordDreamViewModel(startRecordingAction: StartRecording(),
                                    stopRecordingAction: stopRecordingAction)
    }
    
    private func whenRecordButtonIsTouched(viewModel: RecordDreamViewModel) {
        viewModel.recordButtonTouch.onNext(())
    }
    
    private func whenRecordButtonIsTouchedTwice(viewModel: RecordDreamViewModel) {
        whenRecordButtonIsTouched(viewModel: viewModel)
        whenRecordButtonIsTouched(viewModel: viewModel)
    }
    
    private func assertContinueButtonIsEnabled(_ viewModel: RecordDreamViewModel) {
        XCTAssertTrue(viewModel.continueButtonEnabled.value)
    }
    
    private func assertContinueButtonIsDisabled(_ viewModel: RecordDreamViewModel) {
        XCTAssertFalse(viewModel.continueButtonEnabled.value)
    }
    
    private func assertActionIsExecutedOnce(_ action: SpyStartRecording) {
        XCTAssertEqual(action.executeCalls, 1)
    }
    
    private func assertActionIsExecutedOnce(_ action: SpyStopRecording) {
        XCTAssertEqual(action.executeCalls, 1)
    }
}

private class SpyStartRecording: StartRecording {
    
    var executeCalls = 0
    
    override func execute() {
        executeCalls += 1
        
        super.execute()
    }
}

private class SpyStopRecording: StopRecording {
    
    var executeCalls = 0
    
    override func execute() {
        executeCalls += 1
        
        super.execute()
    }
}
