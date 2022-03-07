//
//  HomeViewPresenterProtocolMock.swift
//  GithubTests
//
//  Created by Karthick R on 4/11/21.
//

import Foundation
class HomeViewPresenterProtocolMock: HomeViewPresenter {
    override func callGithubApi(completionHandler: @escaping(Bool, String?) -> ()) {
        super.interactor = interactor
        super.objNetworkManager = NetworkManagerTests()
        super.strApi = strApi
        super.callGithubApi(completionHandler: completionHandler)
    }
}
