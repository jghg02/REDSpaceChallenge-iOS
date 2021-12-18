//
//  DetailCoordinatorTest.swift
//  REDSpaceTestTests
//
//  Created by Josue German Hernandez Gonzalez on 09-12-21.
//

import XCTest
@testable import REDSpaceChallenge_iOS

class DetailCoordinatorTest: XCTestCase {

    var detailCoordinator: DetailCoordinator?
    var navigationBar: UINavigationController!
    
    override func setUp() {
        navigationBar = UINavigationController()
    }
    
    override func tearDown() {
        navigationBar = nil
    }
    
    func testInitDetailCoordinator() {
        detailCoordinator = DetailCoordinator.init(navigationBar)
        detailCoordinator?.start()
        XCTAssertNotNil(detailCoordinator)
        XCTAssertEqual(detailCoordinator?.type, .detail)
        XCTAssertNotNil(detailCoordinator?.navigationController)
    }

}
