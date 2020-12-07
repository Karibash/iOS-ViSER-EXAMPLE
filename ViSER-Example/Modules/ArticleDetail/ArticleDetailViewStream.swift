//
//  ArticleDetailViewStream.swift
//  ViSER-Example
//
//  Created by Karibash on 2020/12/06.
//

import RxCocoa
import RxSwift
import Unio

final class ArticleDetailViewStream: UnioStream<ArticleDetailViewStream>, ArticleDetailViewStreamType {

    convenience init(extra: Extra) {
        self.init(input: Input(),
                  state: State(),
                  extra: extra)
    }

}

extension ArticleDetailViewStream {

    typealias Input = ArticleDetailViewDependency.Input
    typealias Output = ArticleDetailViewDependency.Output
    typealias Extra = ArticleDetailViewDependency.Extra

    static func bind(from dependency: Dependency<Input, NoState, Extra>, disposeBag: DisposeBag) -> Output {
        // MARK: Extra
        let article = dependency.extra.article

        let url = URL(string: "https://zenn.dev/\(article.user.username)/articles/\(article.slug)")

        return Output(
            title: Driver.of(article.title),
            url: Driver.of(URLRequest(url: url!))
        )
    }

}
