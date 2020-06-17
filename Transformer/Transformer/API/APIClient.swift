//
//  APIClient.swift
//  Transformer
//
//  Created by MACPRO on 2019-06-07.
//  Copyright © 2019 Paul Ikhane. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift


class APIClient {
    
    struct Auth {
        static var accountId = 0
        static var requestToken = ""
    }
    
    enum EndPoints {
        static let base = "https://transformers-api.firebaseapp.com"
        
        case getToken
        case transformers
        case deleteTransformer(String)
        
        var stringValue: String {
            switch self {
            case .getToken:
                return EndPoints.base + "/allspark"
            case .transformers:
                return EndPoints.base + "/transformers"
            case .deleteTransformer(let id):
                return EndPoints.base + "/transformers" + "/\(id)"
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }

    //MARK: GET Transformers
    enum GetTransformersFailure: Int, Error {
        case unAuthorized = 401
        case notFound = 404
    }
    
    func getTransformers() -> Observable<[Transformer]> {
        return Observable.create({ observer -> Disposable in
            AF.request(EndPoints.transformers.url)
                .validate()
                .responseJSON(completionHandler: { response in
                    switch response.result {
                    case .success:
                        guard let data = response.data else {
                            observer.onError(response.error ?? GetTransformersFailure.notFound)
                            return
                        }
                        do {
                            let transformers = try JSONDecoder().decode([Transformer].self, from: data)
                            observer.onNext(transformers)
                        } catch {
                            observer.onError(error)
                        }
                    case .failure(let error):
                        if let statusCode = response.response?.statusCode, let reason = GetTransformersFailure(rawValue: statusCode) {
                            observer.onError(reason)
                        }
                        observer.onError(error)
                    }
                })
            return Disposables.create()
        })
    }
    
    //MARK: - Post Transformer
    enum PostTransformerFailure: Int, Error {
        case unAuthorized = 401
        case notFound = 404
    }
    
    func postTransformer() -> Observable<Void> {
        // parameters
        return Observable<Void>.create({ [] observer -> Disposable in
            AF.request("")
                .validate()
                .responseJSON(completionHandler: { [observer] response in
                    switch response.result {
                    case .success:
                        observer.onNext(())
                    case .failure(let error):
                        if let statusCode = response.response?.statusCode, let reason = PostTransformerFailure(rawValue: statusCode) {
                            observer.onError(reason)
                        }
                        observer.onError(error)
                    }
                })
            return Disposables.create()
        })
    }
    
    enum PatchTransformerFailure: Int, Error {
        case unAuthorized = 401
        case notFound = 404
    }
    
    func patchTransformer() -> Observable<Transformer> {
        // parameters
        return Observable.create({ observer in
            AF.request("")
                .validate()
                .responseJSON(completionHandler: { response in
                    switch response.result {
                    case .success:
                        do {
                            guard let data = response.data else {
                                observer.onError(response.error ?? GetTransformersFailure.notFound)
                                return
                            }
                            
                            let transformer = try JSONDecoder().decode(Transformer.self, from: data)
                            observer.onNext(transformer)
                        } catch {
                            observer.onError(error)
                        }
                    case .failure(let error):
                        if let statusCode = response.response?.statusCode, let reason = PatchTransformerFailure(rawValue: statusCode) {
                            observer.onError(reason)
                        }
                        observer.onError(error)
                    }
                })
            return Disposables.create()
        })
    }
    
    //MARK: - Delete Transformer
    enum DeleteTransformerFailure: Int, Error {
        case unAuthorized = 401
        case notFound = 404
    }
    
    func deleteFriend(id: String) -> Observable<Void> {
        return Observable.create({ observable -> Disposable in
            AF.request(EndPoints.deleteTransformer(id).url)
                .validate()
                .responseJSON(completionHandler: { response in
                    switch response.result {
                    case .success:
                        observable.onNext(())
                    case .failure(let error):
                        if let statusCode = response.response?.statusCode, let reason = DeleteTransformerFailure(rawValue: statusCode) {
                            observable.onError(reason)
                        }
                        observable.onError(error)
                    }
                })
            return Disposables.create()
        })
    }
    
}
