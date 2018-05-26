
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
    
    func testWhenRecordButtonIsTouchedTwiceThenContinueButtonIsEnabled() {
        
        let viewModel = givenAViewModel()
        
        whenRecordButtonIsTouchedTwice(viewModel: viewModel)
        
        assertContinueButtonIsEnabled(viewModel)
    }
    
    private func givenAViewModel() -> RecordDreamViewModel {
        return RecordDreamViewModel(startRecordingAction: StartRecording(),
                                    stopRecordingAction: StopRecording())
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
}
