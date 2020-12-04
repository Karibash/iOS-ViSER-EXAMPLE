//
//  Alamofire+Ex.swift
//  ViSER-Example
//
//  Created by Karibash on 2020/12/03.
//

import Foundation
import RxSwift
import Alamofire

extension Alamofire.Session: ReactiveCompatible {}

extension Reactive where Base: Alamofire.Session {
    
    func response<T>(
        _ endpoint: String,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = JSONEncoding.default
    ) -> Single<T> {
        return Single<T>.create { observer in
            let request = AF.request(endpoint, method: method, parameters: parameters, encoding: encoding)
                .response { response in
                    switch response.result {
                    case .success(let data):
                        guard let data = data as? T else {
                            observer(.failure(NSError()))
                            return
                        }
                        observer(.success(data))
                    case .failure(let error):
                        observer(.failure(error))
                    }
                }
            return Disposables.create { request.cancel() }
        }
    }

    func responseDecodable<T: Decodable>(
        _ endpoint: String,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = JSONEncoding.default
    ) -> Single<T> {
        return AF.rx.response(endpoint, method: method, parameters: parameters, encoding: encoding)
            .map { (data: Data) in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(.iso8601)
                let entity = try decoder.decode(T.self, from: data)
                return entity
            }
    }

}
