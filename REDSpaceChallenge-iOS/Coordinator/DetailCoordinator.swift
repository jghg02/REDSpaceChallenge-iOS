//
//  DetailCoordinator.swift
//  REDSpaceTest
//
//  Created by Josue German Hernandez Gonzalez on 05-12-21.
//

import UIKit

class DetailCoordinator: Coordinator {
    
    var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .detail }
    
    var data: CharacterResult.Character?
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = DetailViewController()
        vc.data = data
        let navBar = UINavigationController(rootViewController: vc)

        self.navigationController.present(navBar, animated: true, completion: nil)
    }
    
}
