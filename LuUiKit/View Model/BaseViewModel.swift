//
//  BaseViewModel.swift
//  LuUiKit
//
//  Created by VN Savis on 27/02/2024.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class BaseViewModel: NSObject {
    
    var listCakeDonut = BehaviorSubject<TokenModel?>(value: nil)
    var listDataTest = BehaviorSubject<TestListDataModel>(value: [])
    
    var disposeBag = DisposeBag()
    
    override init() {
        super.init()
        //            _ = listCakeDonut
        //            .subscribe()
        //                .disposed(by: disposeBag)
    }
    
    func getHeaderToken() -> HTTPHeaders {
        let loginString = "username:password"
        
        let base64LoginString = loginString.data(using:.utf8)
        
        return [
            .authorization("Basic \(base64LoginString?.base64EncodedString() ?? "")"),
            .contentType("application/x-www-form-urlencoded")
        ]
    }
    
    func getToken() {
        var parToken: [String : Any] = [:]
        parToken["grant_type"] = "client_credentials"
        parToken["scope"] = ""
        
        AF.request("", method: .post, parameters: parToken, headers: self.getHeaderToken()).responseData{ response in
            switch response.result {
            case .success(let data):
                do {
                    let posts = try JSONDecoder().decode(TokenModel.self, from: data)
                    self.listCakeDonut.onNext(posts)
                    //                    self.listCakeDonut.onCompleted()
                    
                } catch {
                    self.listCakeDonut.onError(error)
                }
            case .failure(let error):
                self.listCakeDonut.onError(error)
            }
        }
    }
    
    func getDataTest(){
        AF.request("https://jsonplaceholder.typicode.com/posts", method: .get).responseData{ response in
            switch response.result {
            case .success(let data):
                do {
                    let posts = try JSONDecoder().decode(TestListDataModel.self, from: data)
                    self.listDataTest.onNext(posts)
                    //                    self.listCakeDonut.onCompleted()
                } catch {
                    self.listDataTest.onError(error)
                }
            case .failure(let error):
                self.listDataTest.onError(error)
            }
        }
    }
    
    func searchData(){
        listDataTest
            .flatMap { models -> Observable<[TestDataModel]> in
                Observable.just(models)
            }
            .map { models -> [TestDataModel] in
                models.filter { $0.id == 3 }
            }
            .subscribe(onNext: { foundValue in
                print("Found: \(foundValue.first?.title)")
                print("Found: \(foundValue.count)")
            })
            .disposed(by: disposeBag)
    }
    
    func searchData1(){
        listDataTest
            .flatMapLatest { models -> Observable<[TestDataModel]> in
                Observable.just(models.filter { $0.title!.lowercased().contains("ea".lowercased()) })
            }
            .subscribe(onNext: { foundValue in
                print("Found: \(foundValue.first?.title)")
                print("Found: \(foundValue.count)")
            })
            .disposed(by: disposeBag)
    }
    
    func searchData2(){
        
        var data: [TestDataModel] = []
        listDataTest
            .map { items in
                items.filter { $0.title!.lowercased().contains("ea".lowercased()) }
            }
            .subscribe(onNext: { foundItems in
                print("Search results: \(foundItems)")
                print("Search results: \(foundItems.count)")
                data = foundItems
            })
            .disposed(by: disposeBag)
        
        self.listDataTest.onNext(data)
    }
    
}
