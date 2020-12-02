//
//  UINavigationController+Ex.swift
//  ViSER-Example
//
//  Created by Karibash on 2020/12/02.
//

import UIKit

extension UINavigationController {

    func pushRouter(_ router: BaseRouter, animated: Bool = true) {
        pushViewController(router.viewController, animated: animated)
    }

    func setRootRouter(_ router: BaseRouter, animated: Bool = true) {
        setViewControllers([router.viewController], animated: animated)
    }

}
