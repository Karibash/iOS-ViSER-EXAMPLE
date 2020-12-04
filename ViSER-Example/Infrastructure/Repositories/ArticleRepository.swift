//
//  ArticleRepository.swift
//  ViSER-Example
//
//  Created by Karibash on 2020/12/03.
//

import RxSwift
import Alamofire
import Kanna

// MARK: - Protocol -

protocol ArticleRepositoryInterface {
    func paginate(page: Int) -> Single<[Article]>
}

// MARK: - Implementations -

final class ArticleRepository: ArticleRepositoryInterface {

    private struct ArticleListResponse: Decodable {
        let articles: [Article]
    }

    func paginate(page: Int) -> Single<[Article]> {
        return AF.rx.responseDecodable("https://api.zenn.dev/articles/recent?page=\(page)")
            .map { (response: ArticleListResponse) in response.articles }
    }

}
