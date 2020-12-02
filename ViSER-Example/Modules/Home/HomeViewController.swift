//
//  HomeViewController.swift
//  ViSER
//
//  Created by Karibash on 2020/12/01.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Public properties -

    var viewStream: HomeViewStreamType!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension HomeViewController: HomeViewInterface {

}
