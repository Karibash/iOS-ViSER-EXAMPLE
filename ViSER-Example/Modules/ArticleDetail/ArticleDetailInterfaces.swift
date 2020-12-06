//
//  ArticleDetailInterfaces.swift
//  ViSER-Example
//
//  Created by Karibash on 2020/12/06.
//

import Unio
import RxSwift
import RxCocoa

protocol ArticleDetailRouterInterface: RouterInterface {

}

protocol ArticleDetailViewInterface: ViewInterface {

}

struct ArticleDetailViewDependency {

    struct Input: InputType {

    }

    struct Output: OutputType {
        let title: Driver<String>
        let url: Driver<URLRequest>
    }

    struct Extra: ExtraType {
        let router: ArticleDetailRouterInterface
        let view: ArticleDetailViewInterface
        let article: Article
    }

}
