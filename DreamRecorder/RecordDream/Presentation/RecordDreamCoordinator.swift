
import UIKit

protocol RecordDreamCoordinatorDelegate: class {
    
}

class RecordDreamCoordinator: Coordinator {
    
    weak var delegate: RecordDreamCoordinatorDelegate?
    
    private let navigationController: UINavigationController
    
    private var controller: RecordDreamViewController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        
        let startRecording = StartRecording()
        let stopRecording = StopRecording()
        
        let viewModel = RecordDreamViewModel(startRecordingAction: startRecording,
                                             stopRecordingAction: stopRecording)
        
        controller = RecordDreamViewController(viewModel: viewModel)
        controller.delegate = self
        
        navigationController.pushViewController(controller, animated: true)
    }
}

extension RecordDreamCoordinator: RecordDreamViewControllerDelegate {
    
}
