//
//  DDDArchitectureTests.swift
//  DDDArchitectureTests
//
//  Created by NoodleKim on 2021/06/16.
//

import XCTest
import UIKit
@testable import DDDArchitecture

class DDDArchitectureTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let testViewInterface = TestViewInterface()
        let testUseCase = TestUseCase()
        let testWireFrame = TestWireFrameImpl()
        let vc = Builder().testBuild(testInterface: testViewInterface, testUseCase: testUseCase, testWireFrame: testWireFrame)

        vc.presenter.viewDidLoad()
        XCTAssertTrue(testViewInterface.shouldSetUIConfiguration)
        XCTAssertEqual(testViewInterface.shouldsetNavigationBatTitle, "タイトル")

        vc.presenter.tappedSubmitButton()
        XCTAssertTrue(testViewInterface.shouldShowCompletionAlert)

        vc.presenter.tappedMoveButton()
        XCTAssertTrue(testWireFrame.shouldShowDetailView)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
