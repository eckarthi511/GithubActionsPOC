//
//  HomeViewInteractor.swift
//  Github
//
//  Created by Karthick R on 4/11/21.
//

import Foundation
protocol HomeViewInteractorProtocol: class {
    /// Call callGithubApi in Interactor and returns HomeViewEntity/NetworkError in Result type
    /// - Returns: responseHandler -> Result<HomeViewEntity, NetworkError>
    /// - Return parameter : HomeViewEntity - Returns HomeViewEntity
    /// - Return parameter : NetworkError - Returns Network Error
    func callGithubApi(strApi: String, responseHandler: @escaping (Result<[HomeViewEntity], NetworkError>) -> ())
    ///  Used to pass Network Manager object
    var objNetworkManager: NetworkManager? { get set }
}

class HomeViewInteractor: HomeViewInteractorProtocol {
    var objNetworkManager: NetworkManager?
    func callGithubApi(strApi: String, responseHandler: @escaping (Result<[HomeViewEntity], NetworkError>) -> ()) {
        objNetworkManager?.callNetworkApi(strApi: strApi, dataHandler: responseHandler)
    }
}
