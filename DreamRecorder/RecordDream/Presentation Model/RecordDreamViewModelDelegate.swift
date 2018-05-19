
protocol RecordDreamViewModelDelegate: class {
    
    func recordStarted()
    func recordStopped()
    
    func showSaveRecordButton()
    func hideSaveRecordButton()
}
