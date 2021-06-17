//
//  Presenter.swift
//  DDDArchitecture
//
//  Created by NoodleKim on 2021/06/16.
//

import Foundation

protocol PresenterOutputs: AnyObject {
    func setUIConfigurations()
    func showCompletionAlert()
    func setNavigationBatTitle(title: String?)
}

protocol PresenterInputs {
    func viewDidLoad()
    func tappedSubmitButton()
    func tappedMoveButton()
}

class Presenter {

    private let useCase: UseCaseInputs
    private weak var view: PresenterOutputs?
    private let wireFrame: WireFrame

    init(view: PresenterOutputs, useCase: UseCaseInputs, wireFrame: WireFrame) {
        self.view = view
        self.useCase = useCase
        self.wireFrame = wireFrame
    }
}

// MARK: - PresenterInputs
extension Presenter: PresenterInputs {
    func viewDidLoad() {
        view?.setUIConfigurations()
        view?.setNavigationBatTitle(title: "タイトル")
    }

    func tappedSubmitButton() {
        useCase.fetchSomething { _ in
            self.view?.showCompletionAlert()
        }
    }

    func tappedMoveButton() {
        self.wireFrame.showDetailView()
    }
}

class TestPresenter {

    var valueForSetUIConfiguration: Bool = false
    var valueForShowCompletionAlert: Bool = false

    private let view: PresenterOutputs
    private let useCase: UseCaseInputs
    private let wireFrame: WireFrame

    init(view: PresenterOutputs, useCase: UseCaseInputs, wireFrame: WireFrame) {
        self.view = view
        self.useCase = useCase
        self.wireFrame = wireFrame
    }
}

class TestViewInterface: PresenterOutputs {
    var shouldSetUIConfiguration: Bool = false
    var shouldShowCompletionAlert: Bool = false
    var shouldsetNavigationBatTitle: String?

    func setUIConfigurations() {
        self.shouldSetUIConfiguration = true
    }
    func showCompletionAlert() {
        self.shouldShowCompletionAlert = true
    }
    func setNavigationBatTitle(title: String?) {
        self.shouldsetNavigationBatTitle = "タイトル"
    }
}
