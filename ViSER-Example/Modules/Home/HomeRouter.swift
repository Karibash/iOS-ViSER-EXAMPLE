//
//  HomeRouter.swift
//  ViSER
//
//  Created by Karibash on 2020/12/02.
//

import UIKit

final class HomeRouter: BaseRouter {

    // MARK: - Private properties

    private let _storyboard = UIStoryboard(name: "Home", bundle: nil)

    // MARK: - Module setup

    init() {
        let viewController = _storyboard.instantiateViewController(ofType: HomeViewController.self)
        super.init(viewController: viewController)

        let articleFetchLogicStream = ArticleFetchLogicStream(extra: .init(
            articleRepository: ArticleRepository()
        ))
        let articlePrefetchLogicStream = ArticlePrefetchLogicStream(extra: .init(
            prefetchRatio: 0.32,
            prefetchInterval: 2
        ))
        let viewStream = HomeViewStream(extra: .init(
            router: self,
            view: viewController,
            articleFetchLogicStream: articleFetchLogicStream,
            articlePrefetchLogicStream: articlePrefetchLogicStream
        ))
        viewController.viewStream = viewStream
    }

}

extension HomeRouter: HomeRouterInterface {

}
