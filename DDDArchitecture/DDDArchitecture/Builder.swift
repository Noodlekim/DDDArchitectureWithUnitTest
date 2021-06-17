//
//  Builder.swift
//  DDDArchitecture
//
//  Created by NoodleKim on 2021/06/16.
//

import Foundation
import UIKit

final class Builder {

    func build() -> ViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! ViewController
        let wireframe = WireFrameImpl(viewController: viewController)
        let useCase = UseCase()
        let presenter = Presenter(view: viewController, useCase: useCase, wireFrame: wireframe)

        viewController.inject(presenter: presenter)
        wireframe.viewController = viewController
        return viewController
    }

    func testBuild(testInterface: TestViewInterface, testUseCase: TestUseCase, testWireFrame: TestWireFrameImpl) -> ViewController {
        let viewController = UIStoryboard(name: "Main", bundle: Bundle(for: type(of: self))).instantiateInitialViewController() as! ViewController

        let presenter = Presenter(view: testInterface, useCase: testUseCase, wireFrame: testWireFrame)
        viewController.inject(presenter: presenter)
        return viewController
    }
}
