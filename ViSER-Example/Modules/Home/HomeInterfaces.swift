//
//  HomeInterfaces.swift
//  ViSER-Example
//
//  Created by Karibash on 2020/12/02.
//

import Unio
import RxSwift
import RxCocoa
import RxDataSources

protocol HomeRouterInterface: RouterInterface {

}

protocol HomeViewInterface: ViewInterface {

}

struct HomeViewDependency {

    struct Input: InputType {
        let artileTableViewContentOffset = PublishRelay<CGPoint>()
        let artileTableViewFrameSize = PublishRelay<CGSize>()
    }

    struct Output: OutputType {
        let articleTableViewSections: Driver<[TableViewSection<Article>]>
    }

    struct Extra: ExtraType {
        let router: HomeRouterInterface
        let view: HomeViewInterface
        let articleFetchLogicStream: ArticleFetchLogicStreamType
        let articlePrefetchLogicStream: ArticlePrefetchLogicStreamType
    }

}

struct ArticleFetchLogicDependency {

    struct Input: InputType {
        let fetchTrigger = PublishRelay<Void>()
    }

    struct Output: OutputType {
        let articles: Observable<[Article]>
    }

    struct State: StateType {
        let articles = BehaviorRelay<[Article]>(value: [])
        let page = BehaviorRelay<Int>(value: 1)
    }

    struct Extra: ExtraType {
        let articleRepository: ArticleRepositoryInterface
    }

}

struct ArticlePrefetchLogicDependency {

    struct Input: InputType {
        let artileTableViewContentOffset = PublishRelay<CGPoint>()
        let artileTableViewFrameSize = PublishRelay<CGSize>()
    }

    struct Output: OutputType {
        let fetchTrigger: Observable<Void>
    }

    struct State: StateType {

    }

    struct Extra: ExtraType {
        let prefetchRatio: CGFloat
        let prefetchInterval: Int
    }

}
