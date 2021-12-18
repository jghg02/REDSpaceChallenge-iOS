//
//  SpinnerViewTest.swift
//  REDSpaceTestTests
//
//  Created by Josue German Hernandez Gonzalez on 09-12-21.
//

import XCTest
@testable import REDSpaceChallenge_iOS

class SpinnerViewTest: XCTestCase {

    var view: SpinnerView!
    
    override func setUp() {
        view = SpinnerView()
    }
    
    override func tearDown() {
        view = nil
    }
    
    func testInitSpinnerView() {
        XCTAssertNotNil(view)
        XCTAssertTrue(view.isKind(of: SpinnerView.self))
        XCTAssertNotNil(view.autoresizingMask)
        XCTAssertNotNil(view.subviews)
    }
    

}
