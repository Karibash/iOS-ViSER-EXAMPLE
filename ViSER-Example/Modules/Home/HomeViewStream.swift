//
//  HomeViewStream.swift
//  ViSER
//
//  Created by Karibash on 2020/12/02.
//

import Unio
import RxSwift
import RxCocoa
import RxRelay
import RxDataSources

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
        // MARK: Input
        let articleTableViewContentOffset = dependency.inputObservables.articleTableViewContentOffset
        let articleTableViewFrameSize = dependency.inputObservables.articleTableViewFrameSize
        let articleSelected = dependency.inputObservables.articleSelected
        let refreshTrigger = dependency.inputObservables.refreshTrigger
        // MARK: Extra
        let router = dependency.extra.router
        let articleFetchLogicStream = dependency.extra.articleFetchLogicStream
        let articlePrefetchLogicStream = dependency.extra.articlePrefetchLogicStream

        articleTableViewContentOffset
            .bind(to: articlePrefetchLogicStream.input.articleTableViewContentOffset)
            .disposed(by: disposeBag)
        articleTableViewFrameSize
            .bind(to: articlePrefetchLogicStream.input.articleTableViewFrameSize)
            .disposed(by: disposeBag)

        refreshTrigger
            .bind(to: articleFetchLogicStream.input.refreshTrigger)
            .disposed(by: disposeBag)
        articlePrefetchLogicStream.output.fetchTrigger
            .bind(to: articleFetchLogicStream.input.fetchTrigger)
            .disposed(by: disposeBag)

        let articleTableViewSections = articleFetchLogicStream.output.articles
            .map { [TableViewSection(items: $0)] }

        articleSelected
            .subscribe(onNext: { router.navigate(to: .detail($0)) })
            .disposed(by: disposeBag)

        return Output(
            articleTableViewSections: articleTableViewSections.asDriver(onErrorDriveWith: Driver.empty()),
            endRefreshingTrigger: articleFetchLogicStream.output.endRefreshingTrigger.asDriver(onErrorDriveWith: Driver.empty())
        )
    }

}
