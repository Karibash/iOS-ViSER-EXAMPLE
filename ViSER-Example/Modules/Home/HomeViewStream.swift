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
        let artileTableViewContentOffset = dependency.inputObservables.artileTableViewContentOffset
        let artileTableViewFrameSize = dependency.inputObservables.artileTableViewFrameSize
        // MARK: Extra
        let articleFetchLogicStream = dependency.extra.articleFetchLogicStream
        let articlePrefetchLogicStream = dependency.extra.articlePrefetchLogicStream

        artileTableViewContentOffset
            .bind(to: articlePrefetchLogicStream.input.artileTableViewContentOffset)
            .disposed(by: disposeBag)
        artileTableViewFrameSize
            .bind(to: articlePrefetchLogicStream.input.artileTableViewFrameSize)
            .disposed(by: disposeBag)
        
        articlePrefetchLogicStream.output.fetchTrigger
            .bind(to: articleFetchLogicStream.input.fetchTrigger)
            .disposed(by: disposeBag)

        let articleTableViewSections = articleFetchLogicStream.output.articles
            .map { [TableViewSection(items: $0)] }

        return Output(
            articleTableViewSections: articleTableViewSections.asDriver(onErrorDriveWith: Driver.empty())
        )
    }

}
