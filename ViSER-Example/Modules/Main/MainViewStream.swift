//
//  MainViewStream.swift
//  ViSER-Example
//
//  Created by Karibash on 2020/12/07.
//

import RxCocoa
import RxSwift
import Unio

final class MainViewStream: UnioStream<MainViewStream>, MainViewStreamType {

    convenience init(extra: Extra) {
        self.init(input: Input(),
                  state: State(),
                  extra: extra)
    }

}

extension MainViewStream {

    typealias Input = MainViewDependency.Input
    typealias Output = MainViewDependency.Output
    typealias Extra = MainViewDependency.Extra

    static func bind(from dependency: Dependency<Input, NoState, Extra>, disposeBag: DisposeBag) -> Output {
        return Output(
        )
    }

}
