//
//  RegistViewModel.swift
//  ARCard
//
//  Created by 築山朋紀 on 2019/03/22.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import RxSwift

final class RegistViewModel {
    let firstbValidationText: Observable<String>
    let firstLoadColor: Observable<UIColor>
    
    init(name: Observable<String?>,
         organizer: Observable<String?>,
         model: RegistModelProtocol) {
        let event = Observable
            .combineLatest(name, organizer)
            .skip(1)
            .flatMap { name, organizer -> Observable<Event<Void>> in
                return model.validate(name: name, organizer: organizer).materialize()
            }.share()
        
        self.firstbValidationText = event
            .flatMap { event -> Observable<String> in
                switch event {
                case .next:
                    return .just("")
                case let .error(error as RegistModelError):
                    return .just(error.errorText)
                case .error, .completed:
                    return .empty()
                }
        }
        
        self.firstLoadColor = event
            .flatMap { event -> Observable<UIColor> in
                switch event {
                case .next:
                    return .just(.green)
                case .error:
                    return .just(.red)
                case .completed:
                    return .empty()
                }
        }
    }
}

extension RegistModelError {
    fileprivate var errorText: String {
        switch self {
        case .invalidName:
            return "名前を入力してください"
        case .invalidOrganizer:
            return "職業を入力してください"
        case .invalidNameAndOrganizer:
            return "名前と職業を入力してください"
        }
    }
}
