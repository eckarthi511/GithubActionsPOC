//
//  HomeViewPresenter.swift
//  Github
//
//  Created by Karthick R on 4/11/21.
//

import Foundation

protocol HomeViewPresenterProtocol: class {
    /// Interactor Protocol
    var interactor: HomeViewInteractorProtocol? { get set }
    /// Router Protocol
    var router: HomeViewRouterProtocol? { get set }
    /// Home view Display Entity Array
    var objHomeViewDisplayEntityArray: [HomeViewDisplayEntity]? { get }
    ///  Used to pass Api - Primarily created for passing ApiStr from Unit Test Case
    var strApi: String? { get set }
    /// Call callGithub Api in Interactor and returns success/errorString in Result type
    /// - Returns: completionHandler -> Result<Bool, String?>
    /// - Return parameter : Bool - Returns true if  Api returns data
    /// - Return parameter : Error - ErrorString if Api returns error
    func callGithubApi(completionHandler: @escaping(Bool, String?) -> ())
}

class HomeViewPresenter: HomeViewPresenterProtocol {
    var interactor: HomeViewInteractorProtocol?
    
    var router: HomeViewRouterProtocol?
    
    var objHomeViewDisplayEntityArray: [HomeViewDisplayEntity]?
    
    var strApi: String?
    
    var objNetworkManager: NetworkManager?
    
    func callGithubApi(completionHandler: @escaping (Bool, String?) -> ()) {
        var apiStr: String?
        if let tempStrApi = strApi {
            apiStr = tempStrApi
        }
        else {
            apiStr = GithubApi
        }
        guard let tempApiStr = apiStr else {
            return completionHandler(false, ApiUrl_Error)
        }
        if objNetworkManager == nil {
            interactor?.objNetworkManager = NetworkManager()
        }
        else {
            interactor?.objNetworkManager = objNetworkManager
        }
        interactor?.callGithubApi(strApi: tempApiStr, responseHandler: { [weak self](result: Result<[HomeViewEntity], NetworkError>) in
            switch result {
            case .success(let objHomeViewEntity):
                self?.objHomeViewDisplayEntityArray = objHomeViewEntity.compactMap { (objHVEntity) -> HomeViewDisplayEntity? in
                    if objHVEntity.commit?.author?.name?.rawValue == objHVEntity.commit?.committer?.name?.rawValue {
                        return HomeViewDisplayEntity(author: objHVEntity.commit?.author?.name?.rawValue, commitHash: objHVEntity.sha, commitMessage: objHVEntity.commit?.message)
                    }
                    else {
                        return nil
                    }
                }
                completionHandler(true, nil)
            case .failure(let networkError):
                completionHandler(false, self?.getErrorString(networkError))
            }
        })
    }
    
    //Returns error string based on Network Error
    private func getErrorString(_ error: NetworkError) -> String {
        switch error {
        case .apiURLError:
            return ApiUrl_Error
        case .dataError:
            return Data_Error
        case .decodeError:
            return Decode_Error
        case .responseError:
            return Response_Error
        case .statusCodeError:
            return StatusCode_Error
        }
    }
}
