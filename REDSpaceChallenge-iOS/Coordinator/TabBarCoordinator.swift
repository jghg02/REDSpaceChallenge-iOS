//
//  TabBarCoordinator.swift
//  REDSpaceTest
//
//  Created by Josue German Hernandez Gonzalez on 04-12-21.
//

import UIKit

enum TabBarPage {
    case characters
    case episodies
    case locations

    init?(index: Int) {
        switch index {
        case 0:
            self = .characters
        case 1:
            self = .episodies
        case 2:
            self = .locations
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .characters:
            return "Characters"
        case .episodies:
            return "Episodies"
        case .locations:
            return "Locations"
        }
    }

    func pageOrderNumber() -> Int {
        switch self {
        case .characters:
            return 0
        case .episodies:
            return 1
        case .locations:
            return 2
        }
    }
    
    func pageIcon() -> UIImage {
        switch self {
        case .characters:
            return UIImage(named: "Character")!.withRenderingMode(.alwaysOriginal)
        case .episodies:
            return UIImage(named: "Episode")!.withRenderingMode(.alwaysOriginal)
        case .locations:
            return UIImage(named: "Location")!.withRenderingMode(.alwaysOriginal)
        }
    }
}

protocol TabCoordinatorProtocol: Coordinator {
    var tabBarController: UITabBarController { get set }
    
    func selectPage(_ page: TabBarPage)
    
    func setSelectedIndex(_ index: Int)
    
    func currentPage() -> TabBarPage?
}

class TabCoordinator: NSObject, Coordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?
        
    var childCoordinators: [Coordinator] = []

    var navigationController: UINavigationController
    
    var tabBarController: UITabBarController

    var type: CoordinatorType { .tab }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = .init()
    }

    func start() {
        // Let's define which pages do we want to add into tab bar
        let pages: [TabBarPage] = [.characters, .episodies, .locations]
            .sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
        
        // Initialization of ViewControllers or these pages
        let controllers: [UINavigationController] = pages.map({ getTabController($0) })
        
        prepareTabBarController(withTabControllers: controllers)
    }
    
    
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        /// Set delegate for UITabBarController
        tabBarController.delegate = self
        /// Assign page's controllers
        tabBarController.setViewControllers(tabControllers, animated: true)
        /// Let set index
        tabBarController.selectedIndex = TabBarPage.characters.pageOrderNumber()
        /// Styling
        tabBarController.tabBar.isTranslucent = true
        
        /// In this step, we attach tabBarController to navigation controller associated with this coordanator
        navigationController.viewControllers = [tabBarController]
    }
      
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)

        navController.tabBarItem = UITabBarItem.init(title: page.pageTitleValue(),
                                                     image: page.pageIcon(),
                                                     tag: page.pageOrderNumber())
        
        switch page {
        case .characters:
            navController.pushViewController(CharacterViewController(), animated: true)
        case .episodies:
            navController.pushViewController(EpisodiesViewController(), animated: true)
        case .locations:
            navController.pushViewController(LocationsViewController(), animated: true)
        }
        
        return navController
    }
    
    func currentPage() -> TabBarPage? { TabBarPage.init(index: tabBarController.selectedIndex) }

    func selectPage(_ page: TabBarPage) {
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    func setSelectedIndex(_ index: Int) {
        guard let page = TabBarPage.init(index: index) else { return }
        
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
}

// MARK: - UITabBarControllerDelegate
extension TabCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        // Some implementation
    }
}
