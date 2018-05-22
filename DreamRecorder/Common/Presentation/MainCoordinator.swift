
import UIKit
import RxSwift

class MainCoordinator: BaseCoordinator<Void> {
    
    private var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() -> Observable<Void> {
        
        _ = startRecordDreamCoordinator()
        
        return Observable.never()
    }
    
    private func startRecordDreamCoordinator() -> Observable<Void> {
        let coordinator = RecordDreamCoordinator(navigationController: navigationController)
        return coordinate(to: coordinator)
    }
}
