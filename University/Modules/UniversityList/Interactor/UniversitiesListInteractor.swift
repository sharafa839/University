//
//  UniversitiesListInteractor.swift
//  University
//
//  Created by Sharaf on 5/1/24.


import Foundation
import RealmSwift

final class UniversitiesListInteractor {
    
    // MARK: - Private properties -
    
    private var repo: UniversityNetworkingProtocol
    weak var view: PresenterToViewProtocol!
    weak var presenter: InteractorToPresenterProtocol?
    init(repo: UniversityNetworkingProtocol = UniversityRepo()) {
        self.repo = repo
    }
}

// MARK: - Extensions -
extension UniversitiesListInteractor: PresenterToInteractorProtocol {
    
    func getUniversitiesFromServer() {
        repo.getUniversities { [weak self] response in
            guard let self  else { return }
            switch response {
            case .success(let data):
                let universities = data.compactMap({University(model: $0)})
                saveUniversitiesInRealm(universities) { [weak self] in                    self?.presenter?.universitiesFetchedSuccessfully(universities)
                }
            case .failure(let apiError):
                presenter?.showErrorMessage(apiError.localizedDescription)
                let universities: [University] = getUniversitiesFromRealm()
                presenter?.universitiesFetchedSuccessfully(universities)
            }
        }
    }
    
    func getUniversitiesFromRealm() -> [University] {
        let repository = RealmService<UniversityRealm>()
        return repository.fetchAll()
    }
    
    func saveUniversitiesInRealm(_ universitiesList: [University], completion: @escaping () -> Void) {
        do {
            let repository = RealmService<UniversityRealm>()
            try repository.deleteAll()
            try repository.save(items: universitiesList)
            completion()
        } catch let error {
            print(error.localizedDescription)
            completion()
        }
    }
}
