//
//  UniversitiesListProtocols.swift
//  University
//
//  Created by Sharaf on 5/1/24.


import UIKit

protocol UniversitiesListPresenterToRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    
    func pushToUniversityDetails(input: UniversityDetailsModuleInput)
    static func createModule() -> UniversitiesListViewController
}

protocol UniversitiesListPresenterToViewProtocol: IndicatableView {
    
    func showErrorMessage(_ errorMessage: String)
    func reloadDate()
}

protocol UniversitiesListViewToPresenterProtocol: AnyObject {
    
    var view: UniversitiesListPresenterToViewProtocol? { get set }
    var interactor: PresenterToInteractorProtocol? { get set }
    var universities: [University] { get }
    var universitiesCount: Int { get }
    var router: UniversitiesListPresenterToRouterProtocol? { get set }
    
    func getAllUniversities()
    func viewDidLoad()
    func didSelectUniversity(_ university: University)
   
}

protocol PresenterToInteractorProtocol: AnyObject {
    
    var presenter: InteractorToPresenterProtocol? { get set }
    func getUniversitiesFromServer()
    func getUniversitiesFromRealm() -> [University]
    func saveUniversitiesInRealm(_ articleList: [University], completion: @escaping () -> Void)
}


protocol InteractorToPresenterProtocol: AnyObject {
    
    func universitiesFetchedSuccessfully(_ universities: [University])
    func showErrorMessage(_ errorMessage: String)
}



protocol IndicatableView: AnyObject {
    func showActivityIndicator()
    func hideActivityIndicator()
}
