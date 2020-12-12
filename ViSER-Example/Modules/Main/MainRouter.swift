//
//  MainRouter.swift
//  ViSER-Example
//
//  Created by Karibash on 2020/12/07.
//

import UIKit

final class MainRouter: BaseRouter {

    // MARK: - Private properties

    private let _storyboard = UIStoryboard(name: "Main", bundle: nil)

    // MARK: - Module setup

    init() {
        let viewController = _storyboard.instantiateViewController(ofType: MainViewController.self)
        super.init(viewController: viewController)

        let viewStream = MainViewStream(extra: .init(
            router: self,
            view: viewController
        ))
        viewController.viewStream = viewStream

        let articlesRouter = ArticlesRouter()
        let articlesViewController = AppNavigationController()
        articlesViewController.setRootRouter(articlesRouter)
        let articlesTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "books.vertical.fill"), selectedImage: nil)
        articlesRouter.viewController.tabBarItem = articlesTabBarItem

        viewController.setViewControllers([
            articlesViewController
        ], animated: false)
    }

}

extension MainRouter: MainRouterInterface {

}
