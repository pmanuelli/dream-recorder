
import UIKit

class MainCoordinator: Coordinator {
    
    private var childCoordinators = [Coordinator]()
    private var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        pushRecordDream()
    }
    
    private func pushRecordDream() {
        
        let coordinator = RecordDreamCoordinator(navigationController: navigationController)
        coordinator.delegate = self
        coordinator.start()
        
        childCoordinators.append(coordinator)
    }
    
    private func removeCoordinator(_ coordinator: Coordinator) {
        
        guard let index = childCoordinators.index(where: { $0 === coordinator } )else {
            return
        }
        
        childCoordinators.remove(at: index)
    }
}

extension MainCoordinator: RecordDreamCoordinatorDelegate {
    
}
