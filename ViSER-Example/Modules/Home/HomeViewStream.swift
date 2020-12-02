//
//  HomeViewStream.swift
//  ViSER
//
//  Created by Karibash on 2020/12/02.
//

import Unio
import RxSwift
import RxRelay

protocol HomeViewStreamType: class {
    var input: InputWrapper<HomeViewDependency.Input> { get }
    var output: OutputWrapper<HomeViewDependency.Output> { get }
}

final class HomeViewStream: UnioStream<HomeViewStream>, HomeViewStreamType {

    convenience init(extra: Extra) {
        self.init(input: Input(),
                   state: State(),
                   extra: extra)
    }

}

extension HomeViewStream {

    typealias Input = HomeViewDependency.Input
    typealias Output = HomeViewDependency.Output
    typealias Extra = HomeViewDependency.Extra

    static func bind(from dependency: Dependency<Input, NoState, Extra>, disposeBag: DisposeBag) -> Output {
        return Output()
    }

}
