//
//  ArticleListPresenter.swift
//  University
//
//  Created by Sharaf on 5/1/24.

import UIKit

final class UniversitiesListPresenter {
    
    // MARK: - Private properties -
    
    var view: UniversitiesListPresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: UniversitiesListPresenterToRouterProtocol?
    var universities: [University] = []
    var universitiesCount: Int {
        return universities.count
    }
}

// MARK: - Extensions -

extension UniversitiesListPresenter: UniversitiesListViewToPresenterProtocol {
    
    func viewDidLoad() {
        getAllUniversities()
        view?.showActivityIndicator()
    }
    
    func didSelectUniversity(_ university: University) {
        let input = UniversityDetailsModuleInput(university: university) { [weak self] in
            self?.viewDidLoad()
        }
        router?.pushToUniversityDetails(input: input)
    }
    
    func getAllUniversities() {
        interactor?.getUniversitiesFromServer()
    }
}

extension UniversitiesListPresenter: InteractorToPresenterProtocol {
    func showErrorMessage(_ errorMessage: String) {
        view?.showErrorMessage(errorMessage)
    }
    
    func universitiesFetchedSuccessfully(_ universities: [University]) {
        self.universities = universities
        view?.reloadDate()
    }
}
