//
//  AlamofireInterceptor.swift
//  LuUiKit
//
//  Created by VN Savis on 28/02/2024.
//

import Foundation
import Alamofire

class AlamofireInterceptor: RequestInterceptor {
    
    func adapt( _ urlRequest: URLRequest, for session: Session, completion: @escaping (Swift.Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        
        let timeout: TimeInterval = 30
        request.timeoutInterval = timeout
        request.headers = []
        completion(.success(request))
    }
    
    func retry( _ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        
        let res = request.task?.response as? HTTPURLResponse
        if (res?.statusCode == 401) {
            print("=======> 401")
            // TODO: auth
            //            ApiHelper.shared.getToken { hasToken in
            //                if hasToken {
            //                    print("====> retry get token by code 401")
            //                }
            //            }
            completion(.retryWithDelay(3))
        }
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 else {
            completion(.doNotRetryWithError(error))
            return
        }
    }
    
}
