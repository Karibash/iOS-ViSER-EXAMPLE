//
//  ArticleDetailViewController.swift
//  ViSER-Example
//
//  Created by Karibash on 2020/12/06.
//

import UIKit
import WebKit
import RxSwift

final class ArticleDetailViewController: UIViewController {

    // MARK: - Public properties

    var viewStream: ArticleDetailViewStreamType!

    // MARK: - Private properties
    @IBOutlet private weak var webView: WKWebView!
    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationTitle()
        setupWebView()
    }

    private func setupNavigationTitle() {
        viewStream.output.title
            .bind(to: navigationItem.rx.title)
            .disposed(by: disposeBag)
    }

    private func setupWebView() {
        viewStream.output.url
            .subscribe(onNext: { [self] in webView.load($0) })
            .disposed(by: disposeBag)
    }

}

extension ArticleDetailViewController: ArticleDetailViewInterface {

}
