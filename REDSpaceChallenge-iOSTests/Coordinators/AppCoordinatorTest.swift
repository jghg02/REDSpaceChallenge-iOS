//
//  AppCoordinatorTest.swift
//  REDSpaceTestTests
//
//  Created by Josue German Hernandez Gonzalez on 09-12-21.
//

import XCTest
@testable import REDSpaceChallenge_iOS

class AppCoordinatorTest: XCTestCase {

    var appCoordinator: AppCoordinator?
    var navigationBar: UINavigationController!
    
    override func setUp() {
        navigationBar = UINavigationController()
    }
    
    override func tearDown() {
        navigationBar = nil
    }
    
    func testInitAppCoordinator() {
        appCoordinator = AppCoordinator.init(navigationBar)
        appCoordinator?.start()
        XCTAssertNotNil(appCoordinator)
        XCTAssertEqual(appCoordinator?.type, .app)
        XCTAssertNotNil(appCoordinator?.navigationController)
    }
 
}
