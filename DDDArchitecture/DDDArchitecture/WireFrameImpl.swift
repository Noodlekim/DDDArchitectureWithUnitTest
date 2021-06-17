//
//  WireFrame.swift
//  DDDArchitecture
//
//  Created by NoodleKim on 2021/06/16.
//

import Foundation
import UIKit

protocol WireFrame: AnyObject {
    var viewController: UIViewController? { get set }
    func showDetailView()
}

final class WireFrameImpl: WireFrame {

    weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func showDetailView() {
//        let detailViewController = DetailViewController()
        let nextViewController = Builder().build()
        self.viewController?.show(nextViewController, sender: nil)
    }
}

class TestWireFrameImpl: WireFrame {
    weak var viewController: UIViewController?
    var shouldShowDetailView: Bool = false

    init() { }

    func showDetailView() {
        shouldShowDetailView = true
    }
}
