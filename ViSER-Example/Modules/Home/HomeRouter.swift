//
//  HomeRouter.swift
//  ViSER
//
//  Created by Karibash on 2020/12/02.
//

import UIKit

final class HomeRouter: BaseRouter {

    // MARK: - Private properties -

    private let _storyboard = UIStoryboard(name: "Home", bundle: nil)

    // MARK: - Module setup -

    init() {
        let viewController = _storyboard.instantiateViewController(ofType: HomeViewController.self)
        super.init(viewController: viewController)

        let viewStream = HomeViewStream(
            extra: .init(
                router: self,
                view: viewController
            )
        )
        viewController.viewStream = viewStream
    }

}

extension HomeRouter: HomeRouterInterface {

}
