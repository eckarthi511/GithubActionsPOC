//
//  HomeViewRouter.swift
//  Github
//
//  Created by Karthick R on 4/11/21.
//

import Foundation

protocol HomeViewRouterProtocol: class {
    /// Create and return HomeViewController
    static func createHomeViewController() -> HomeViewController
}

class HomeViewRouter: HomeViewRouterProtocol {
    static func createHomeViewController() -> HomeViewController {
        let viewController = HomeViewController()
        let presenter: HomeViewPresenterProtocol = HomeViewPresenter()
        let interactor: HomeViewInteractorProtocol = HomeViewInteractor()
        let router: HomeViewRouterProtocol = HomeViewRouter()

        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router

        return viewController
    }
}
