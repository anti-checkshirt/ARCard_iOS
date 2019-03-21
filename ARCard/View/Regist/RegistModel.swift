//
//  RegistModel.swift
//  ARCard
//
//  Created by 築山朋紀 on 2019/03/22.
//  Copyright © 2019 tomoki. All rights reserved.
//

import RxSwift

enum RegistModelError: Error {
    case invalidName
    case invalidOrganizer
    case invalidNameAndOrganizer
}

protocol RegistModelProtocol {
    func validate(name: String?, organizer: String?) -> Observable<Void>
}

final class RegistModel: RegistModelProtocol {
    func validate(name: String?, organizer: String?) -> Observable<Void> {
        switch (name, organizer) {
        case (.none, .none):
            return Observable.error(RegistModelError.invalidNameAndOrganizer)
        case (.none, .some):
            return Observable.error(RegistModelError.invalidName)
        case (.some, .none):
            return Observable.error(RegistModelError.invalidOrganizer)
        case (let name?, let organizer?):
            switch (name.isEmpty, organizer.isEmpty) {
            case (true, true):
                return Observable.error(RegistModelError.invalidNameAndOrganizer)
            case (true, false):
                return Observable.error(RegistModelError.invalidName)
            case (false, true):
                return Observable.error(RegistModelError.invalidOrganizer)
            case (false, false):
                return Observable.just(())
            }
        }
    }
}
