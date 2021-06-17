//
//  Repository.swift
//  DDDArchitecture
//
//  Created by NoodleKim on 2021/06/16.
//

import Foundation


class Repository {

    func fetch(_ callback: @escaping ((String) -> Void)) {
        callback("value")
    }
}
