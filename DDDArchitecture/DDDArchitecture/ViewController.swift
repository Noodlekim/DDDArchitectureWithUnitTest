//
//  ViewController.swift
//  DDDArchitecture
//
//  Created by NoodleKim on 2021/06/16.
//

import UIKit

class ViewController: UIViewController {

    var presenter: Presenter!

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        // FIXME: 本来はBuilder()で処理
        self.presenter = Presenter(view: self, useCase: UseCase(), wireFrame: WireFrameImpl(viewController: self))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }

    @IBAction func tappedSubmitButton(_ sender: Any) {
        presenter.tappedSubmitButton()
    }

    @IBAction func tappedMoveButton(_ sender: Any) {
        presenter.tappedMoveButton()
    }


    public func inject(presenter: Presenter) {
        self.presenter = presenter
    }
}

extension ViewController: PresenterOutputs {
    func setNavigationBatTitle(title: String?) {
        self.title = "タイトル"
    }

    func setUIConfigurations() {
        self.navigationController?.navigationBar.isHidden = true
    }

    func showCompletionAlert() {
        print("Show alert!")
    }
}
