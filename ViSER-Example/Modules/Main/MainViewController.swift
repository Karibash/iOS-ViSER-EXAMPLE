//
//  MainViewController.swift
//  ViSER-Example
//
//  Created by Karibash on 2020/12/07.
//

import UIKit
import WebKit
import RxSwift

final class MainViewController: UITabBarController {

    // MARK: - Public properties

    var viewStream: MainViewStreamType!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension MainViewController: MainViewInterface {

}
