//
//  ArticlesInterfaces.swift
//  ViSER-Example
//
//  Created by Karibash on 2020/12/02.
//

import Unio
import RxSwift
import RxCocoa
import RxDataSources

enum ArticlesNavigationOption {
    case detail(Article)
}

protocol ArticlesRouterInterface: RouterInterface {
    func navigate(to option: ArticlesNavigationOption)
}

protocol ArticlesViewInterface: ViewInterface {

}

struct ArticlesViewDependency {

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
        let router: ArticlesRouterInterface
        let view: ArticlesViewInterface
        let articleFetchLogicStream: ArticleFetchLogicStreamType
        let articlePrefetchLogicStream: ArticlePrefetchLogicStreamType
    }

}

protocol ArticlesViewStreamType {
    var input: InputWrapper<ArticlesViewDependency.Input> { get }
    var output: OutputWrapper<ArticlesViewDependency.Output> { get }
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
