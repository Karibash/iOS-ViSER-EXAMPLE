//
//  UIViewController+Ex.swift
//  ViSER-Example
//
//  Created by Karibash on 2020/12/02.
//

import UIKit

extension UIViewController {

    func presentRouter(_ router: BaseRouter, animated: Bool = true, completion: (() -> Void)? = nil) {
        present(router.viewController, animated: animated, completion: completion)
    }

}
