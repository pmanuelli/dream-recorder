
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
        
        controller = RecordDreamViewController(nibName: .none, bundle: .none)
        controller.delegate = self
        
        navigationController.pushViewController(controller, animated: true)
    }
}

extension RecordDreamCoordinator: RecordDreamViewControllerDelegate {
    
}
