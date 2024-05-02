//
//  UniversityDetailsProtocols.swift
//  University
//
//  Created by Sharaf on 5/2/24.
//

import Foundation

protocol UniversityDetailsPresenterToViewProtocol: AnyObject {
    var presenter: UniversityDetailsViewToPresenterProtocol? { get set }
    
    func showDetails(forUniversity university: University)
}

protocol UniversityDetailsViewToPresenterProtocol: AnyObject {
    var view: UniversityDetailsPresenterToViewProtocol? { get set }
    
    func viewDidLoad()
    func viewDidDisappear()
}

protocol UniversityDetailsPresenterToRouterProtocol: AnyObject {
    
    static func createModule(input: UniversityDetailsModuleInput) -> UniversityDetailsViewController
}
