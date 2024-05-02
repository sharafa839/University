//
//  UniversitiesListRouter.swift
//  University
//
//  Created by Sharaf on 5/1/24.


import UIKit

final class UniversitiesListRouter: UniversitiesListPresenterToRouterProtocol {
    
    
    // MARK: - Private properties -
    weak var viewController: UIViewController?
    
    static func createModule() -> UniversitiesListViewController {
        
        let view = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "UniversitiesListViewController") as! UniversitiesListViewController
        let presenter: UniversitiesListViewToPresenterProtocol & InteractorToPresenterProtocol = UniversitiesListPresenter()
        let interactor: PresenterToInteractorProtocol = UniversitiesListInteractor()
        let router: UniversitiesListPresenterToRouterProtocol = UniversitiesListRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
    func pushToUniversityDetails(input: UniversityDetailsModuleInput) {
        let detailsViewController = UniversityDetailsRouter.createModule(input: input)
        viewController?.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}


// MARK: - Extensions -

extension UIStoryboard {
    static var mainStoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
