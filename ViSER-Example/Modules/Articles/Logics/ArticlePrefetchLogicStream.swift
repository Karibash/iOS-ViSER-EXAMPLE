//
//  ArticlePrefetchLogicStream.swift
//  ViSER-Example
//
//  Created by Karibash on 2020/12/04.
//

import RxCocoa
import RxSwift
import Unio

final class ArticlePrefetchLogicStream: UnioStream<ArticlePrefetchLogicStream>, ArticlePrefetchLogicStreamType {

    convenience init(extra: Extra) {
        self.init(input: Input(),
                  state: State(),
                  extra: extra)
    }

}

extension ArticlePrefetchLogicStream {

    typealias Input = ArticlePrefetchLogicDependency.Input
    typealias Output = ArticlePrefetchLogicDependency.Output
    typealias State = ArticlePrefetchLogicDependency.State
    typealias Extra = ArticlePrefetchLogicDependency.Extra

    static func bind(from dependency: Dependency<Input, State, Extra>, disposeBag: DisposeBag) -> Output {
        // MARK: Input
        let contentOffset = dependency.inputObservables.articleTableViewContentOffset
        let viewFrameSize = dependency.inputObservables.articleTableViewFrameSize
        // MARK: Extra
        let prefetchRatio = dependency.extra.prefetchRatio
        let prefetchInterval = dependency.extra.prefetchInterval

        let fetchTrigger = Observable.combineLatest(contentOffset, viewFrameSize)
            .filter { $0.y > ($1.height * prefetchRatio) }
            .throttle(DispatchTimeInterval.seconds(prefetchInterval), latest: false, scheduler: ConcurrentMainScheduler.instance)
            .map { _ in }
            .startWith(())

        return Output(
            fetchTrigger: fetchTrigger
        )
    }

}
