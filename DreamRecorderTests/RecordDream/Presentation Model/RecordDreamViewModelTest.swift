
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
        
        viewModel.recordButtonTouched()
        
        assertContinueButtonIsDisabled(viewModel)
    }
    
    func testWhenRecordButtonIsTouchedTwiceThenContinueButtonIsEnabled() {
        
        let viewModel = givenAViewModel()
        
        viewModel.recordButtonTouched()
        viewModel.recordButtonTouched()
        
        assertContinueButtonIsEnabled(viewModel)
    }
    
    private func givenAViewModel() -> RecordDreamViewModel {
        return RecordDreamViewModel(startRecordingAction: StartRecording(),
                                    stopRecordingAction: StopRecording())
    }
    
    private func assertContinueButtonIsEnabled(_ viewModel: RecordDreamViewModel) {
        XCTAssertTrue(viewModel.continueButtonEnabled.value)
    }
    
    private func assertContinueButtonIsDisabled(_ viewModel: RecordDreamViewModel) {
        XCTAssertFalse(viewModel.continueButtonEnabled.value)
    }
}
