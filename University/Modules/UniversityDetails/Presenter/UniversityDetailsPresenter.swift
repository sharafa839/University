//
//  UniversityDetailsPresenter.swift
//  University
//
//  Created by Sharaf on 5/2/24.
//

import Foundation

class UniversityDetailsPresenter : UniversityDetailsViewToPresenterProtocol {
    
    weak var view: UniversityDetailsPresenterToViewProtocol?
    var router: UniversityDetailsRouter?
    let input: UniversityDetailsModuleInput

    init(input: UniversityDetailsModuleInput) {
        self.input = input
    }
    
    func viewDidLoad() {
        view?.showDetails(forUniversity: input.university)
    }
    
    func viewDidDisappear() {
        input.refreshList()
    }
}
