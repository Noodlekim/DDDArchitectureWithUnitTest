//
//  UseCase.swift
//  DDDArchitecture
//
//  Created by NoodleKim on 2021/06/16.
//

import Foundation

protocol UseCaseInputs {
    func fetchSomething(_ callback: @escaping ((String) -> Void))
}

struct UseCase {
    let repository = Repository()
}

extension UseCase: UseCaseInputs {
    func fetchSomething(_ callback: @escaping ((String) -> Void)) {
        repository.fetch(callback)
    }
}

struct TestUseCase {
    let repository = Repository()
}

extension TestUseCase: UseCaseInputs {

    func fetchSomething(_ callback: @escaping ((String) -> Void)) {
        callback("dummy")
    }
}
