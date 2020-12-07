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

enum HomeNavigationOption {
    case detail(Article)
}

protocol HomeRouterInterface: RouterInterface {
    func navigate(to option: HomeNavigationOption)
}

protocol HomeViewInterface: ViewInterface {

}

struct HomeViewDependency {

    struct Input: InputType {
        let articleTableViewContentOffset = PublishRelay<CGPoint>()
        let articleTableViewFrameSize = PublishRelay<CGSize>()
        let articleSelected = PublishRelay<Article>()
        let refreshTrigger = PublishRelay<Void>()
    }

    struct Output: OutputType {
        let articleTableViewSections: Driver<[TableViewSection<Article>]>
        let endRefreshingTrigger: Driver<Void>
    }

    struct Extra: ExtraType {
        let router: HomeRouterInterface
        let view: HomeViewInterface
        let articleFetchLogicStream: ArticleFetchLogicStreamType
        let articlePrefetchLogicStream: ArticlePrefetchLogicStreamType
    }

}

protocol HomeViewStreamType {
    var input: InputWrapper<HomeViewDependency.Input> { get }
    var output: OutputWrapper<HomeViewDependency.Output> { get }
}

struct ArticleFetchLogicDependency {

    struct Input: InputType {
        let fetchTrigger = PublishRelay<Void>()
        let refreshTrigger = PublishRelay<Void>()
    }

    struct Output: OutputType {
        let articles: Observable<[Article]>
        let endRefreshingTrigger: Observable<Void>
    }

    struct State: StateType {
        let articles = BehaviorRelay<[Article]>(value: [])
        let page = BehaviorRelay<Int>(value: 1)
    }

    struct Extra: ExtraType {
        let articleRepository: ArticleRepositoryInterface
    }

}

protocol ArticleFetchLogicStreamType: AnyObject {
    var input: InputWrapper<ArticleFetchLogicDependency.Input> { get }
    var output: OutputWrapper<ArticleFetchLogicDependency.Output> { get }
}

struct ArticlePrefetchLogicDependency {

    struct Input: InputType {
        let articleTableViewContentOffset = PublishRelay<CGPoint>()
        let articleTableViewFrameSize = PublishRelay<CGSize>()
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

protocol ArticlePrefetchLogicStreamType: AnyObject {
    var input: InputWrapper<ArticlePrefetchLogicDependency.Input> { get }
    var output: OutputWrapper<ArticlePrefetchLogicDependency.Output> { get }
}
