//
//  ArticleDetailRouter.swift
//  ViSER-Example
//
//  Created by Karibash on 2020/12/06.
//

import UIKit

final class ArticleDetailRouter: BaseRouter {

    // MARK: - Private properties

    private let _storyboard = UIStoryboard(name: "ArticleDetail", bundle: nil)

    // MARK: - Module setup

    init(article: Article) {
        let viewController = _storyboard.instantiateViewController(ofType: ArticleDetailViewController.self)
        super.init(viewController: viewController)

        let viewStream = ArticleDetailViewStream(extra: .init(
            router: self,
            view: viewController,
            article: article
        ))
        viewController.viewStream = viewStream
    }

}

extension ArticleDetailRouter: ArticleDetailRouterInterface {

}
