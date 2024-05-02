//
//  UniversityDetailsRouter.swift
//  University
//
//  Created by Sharaf on 5/2/24.
//

import Foundation
import UIKit

struct UniversityDetailsModuleInput {
    
    let university: University
    var refreshList: () -> Void
}

class UniversityDetailsRouter: UniversityDetailsPresenterToRouterProtocol {
    
    static func createModule(input: UniversityDetailsModuleInput) -> UniversityDetailsViewController {
        
        let view = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "UniversityDetailsViewController") as! UniversityDetailsViewController
        
        let presenter = UniversityDetailsPresenter(input: input)
        view.presenter = presenter
        presenter.view = view
        presenter.router = UniversityDetailsRouter()
        return view
    }
}
