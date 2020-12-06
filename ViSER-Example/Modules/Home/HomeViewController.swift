//
//  HomeViewController.swift
//  ViSER
//
//  Created by Karibash on 2020/12/01.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

final class HomeViewController: UIViewController {

    // MARK: - Public properties

    var viewStream: HomeViewStreamType!

    // MARK: - Private properties

    @IBOutlet private weak var articleTableView: UITableView!
    private let refreshControl = UIRefreshControl()
    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefreshControl()
        setupArticleTableView()
    }

    private func setupRefreshControl() {
        articleTableView.refreshControl = refreshControl
        refreshControl.rx.controlEvent(.valueChanged)
            .bind(to: viewStream.input.refreshTrigger)
            .disposed(by: disposeBag)

        viewStream.output.endRefreshingTrigger
            .subscribe(onNext: { [self] in refreshControl.endRefreshing() })
            .disposed(by: disposeBag)
    }

    private func setupArticleTableView() {
        let cellIdentifier = String(describing: ArticleTableViewCell.self)
        articleTableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)

        articleTableView.rx.contentOffset
            .bind(to: viewStream.input.articleTableViewContentOffset)
            .disposed(by: disposeBag)
        articleTableView.rx.contentOffset
            .map { [self] _ in articleTableView.contentSize }
            .distinctUntilChanged()
            .bind(to: viewStream.input.articleTableViewFrameSize)
            .disposed(by: disposeBag)

        articleTableView.rx.modelSelected(Article.self)
            .bind(to: viewStream.input.articleSelected)
            .disposed(by: disposeBag)

        let dataSource = RxTableViewSectionedReloadDataSource<TableViewSection<Article>>(
            configureCell: { dataSource, tableView, indexPath, item in
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ArticleTableViewCell
                cell.configure(item)
                return cell
            }
        )
        viewStream.output.articleTableViewSections
            .bind(to: articleTableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }

}

extension HomeViewController: HomeViewInterface {

}
