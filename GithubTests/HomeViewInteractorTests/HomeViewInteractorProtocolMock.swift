//
//  HomeViewInteractorProtocolMock.swift
//  GithubTests
//
//  Created by Karthick R on 4/11/21.
//

import Foundation

class HomeViewInteractorProtocolMock: HomeViewInteractor {
    override func callGithubApi(strApi: String, responseHandler: @escaping (Result<[HomeViewEntity], NetworkError>) -> ()) {
        super.objNetworkManager = objNetworkManager
        super.callGithubApi(strApi: strApi, responseHandler: responseHandler)
    }
}

class NetworkManagerTests: NetworkManager {
    override func callNetworkApi<T:Codable>(strApi: String, dataHandler: @escaping (Result<T, NetworkError>) -> ()) {
        if strApi.contains("https://") {
            let objName = Name(rawValue: "Karthick R")
            let objCommitAuthor = CommitAuthor(name: objName, email: .eckarthi511GmailCOM, date: "2021-04-11T22:49:03Z")
            let objCommit = Commit(author: objCommitAuthor, committer: objCommitAuthor, message: "Code Commit", tree: nil, url: nil, commentCount: nil, verification: nil)
            let objHomeViewEntity = HomeViewEntity(sha: "", nodeID: nil, commit: objCommit, url: nil, htmlURL: nil, commentsURL: nil, author: nil, committer: nil, parents: nil)
            dataHandler(.success([objHomeViewEntity, objHomeViewEntity] as! T))
        }
        else if strApi == Empty_Text {
            dataHandler(.failure(.apiURLError))
        }
        else if strApi == StatusCode_Error {
            dataHandler(.failure(.statusCodeError))
        }
        else if strApi == Data_Error {
            dataHandler(.failure(.dataError))
        }
        else if strApi == Decode_Error {
            dataHandler(.failure(.decodeError))
        }
        else if strApi == Response_Error {
            dataHandler(.failure(.responseError))
        }
    }
}
