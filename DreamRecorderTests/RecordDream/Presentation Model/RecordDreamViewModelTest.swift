
@testable import DreamRecorder

import XCTest
import RxSwift

class RecordDreamViewModelTest: XCTestCase {
    
    func testWhenViewModelIsCreatedThenContinueButtonIsDisabled() {
        
        let viewModel = RecordDreamViewModel()
        
        assertContinueButtonIsDisabled(viewModel)
    }
    
    func testWhenRecordButtonIsTouchedOnceThenContinueButtonIsDisabled() {
        
        let viewModel = RecordDreamViewModel()
        
        viewModel.recordButtonTouched()
        
        assertContinueButtonIsDisabled(viewModel)
    }
    
    func testWhenRecordButtonIsTouchedTwiceThenContinueButtonIsEnabled() {
        
        let viewModel = RecordDreamViewModel()
        
        viewModel.recordButtonTouched()
        viewModel.recordButtonTouched()
        
        assertContinueButtonIsEnabled(viewModel)
    }
    
    private func assertContinueButtonIsEnabled(_ viewModel: RecordDreamViewModel) {
        XCTAssertTrue(viewModel.continueButtonEnabled.value)
    }
    
    private func assertContinueButtonIsDisabled(_ viewModel: RecordDreamViewModel) {
        XCTAssertFalse(viewModel.continueButtonEnabled.value)
    }
}
