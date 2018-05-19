
@testable import DreamRecorder

import XCTest
import RxSwift

class RecordDreamViewModelTest: XCTestCase {
    
    func testWhenViewModelIsCreatedThenSaveRecordButtonIsDisabled() {
        
        let viewModel = RecordDreamViewModel()
        
        assertSaveRecordButtonIsDisabled(viewModel)
    }
    
    func testWhenRecordButtonIsTouchedOnceThenSaveRecordButtonIsDisabled() {
        
        let viewModel = RecordDreamViewModel()
        
        viewModel.recordButtonTouched()
        
        assertSaveRecordButtonIsDisabled(viewModel)
    }
    
    func testWhenRecordButtonIsTouchedTwiceThenSaveRecordButtonIsEnabled() {
        
        let viewModel = RecordDreamViewModel()
        
        viewModel.recordButtonTouched()
        viewModel.recordButtonTouched()
        
        assertSaveRecordButtonIsEnabled(viewModel)
    }
    
    private func assertSaveRecordButtonIsEnabled(_ viewModel: RecordDreamViewModel) {
        XCTAssertTrue(viewModel.saveRecordButtonEnabled.value)
    }
    
    private func assertSaveRecordButtonIsDisabled(_ viewModel: RecordDreamViewModel) {
        XCTAssertFalse(viewModel.saveRecordButtonEnabled.value)
    }
}
