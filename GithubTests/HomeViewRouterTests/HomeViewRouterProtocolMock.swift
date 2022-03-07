//
//  HomeViewRouterMock.swift
//  GithubTests
//
//  Created by Karthick R on 4/11/21.
//

import Foundation
class HomeViewRouterProtocolMock: HomeViewRouterProtocol {
    static func createHomeViewController() -> HomeViewController {
        let viewController = HomeViewController()
        let presenter: HomeViewPresenterProtocolMock = HomeViewPresenterProtocolMock()
        let interactor: HomeViewInteractorProtocolMock = HomeViewInteractorProtocolMock()
        
        viewController.presenter = presenter
        presenter.interactor = interactor

        return viewController
    }
}
