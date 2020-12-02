//
//  BaseRouter.swift
//  ViSER-Example
//
//  Created by Karibash on 2020/12/02.
//

import UIKit
import SafariServices

protocol RouterInterface: class {

}

class BaseRouter {

    fileprivate unowned var _viewController: UIViewController
    
    var viewController: UIViewController {
        return _viewController
    }

    var navigationController: UINavigationController? {
        return viewController.navigationController
    }

    init(viewController: UIViewController) {
        _viewController = viewController
    }

}

extension BaseRouter: RouterInterface {

}
