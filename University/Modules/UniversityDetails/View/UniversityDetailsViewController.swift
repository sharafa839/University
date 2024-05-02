//
//  UniversityDetailsViewController.swift
//  University
//
//  Created by Sharaf on 5/2/24.
//

import UIKit

class UniversityDetailsViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak private var UniversityNameLabel: UILabel!
    @IBOutlet weak private var universityStateLabel: UILabel!
    @IBOutlet weak private var countryLabel: UILabel!
    @IBOutlet weak private var countryCodeLabel: UILabel!
    @IBOutlet weak private var webpageButton: UIButton!
    @IBOutlet weak private var reloadButton: UIButton!
    
    //MARK: - Properties
    var presenter: UniversityDetailsViewToPresenterProtocol?
    private var url: String = ""
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    //MARK: - Actions
    
    @IBAction func webpageAction(_ sender: UIButton) {
        HelperK.openWeb(url: url)
    }
    
    @IBAction func reloadAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        presenter?.viewDidDisappear()
    }
}

extension UniversityDetailsViewController: UniversityDetailsPresenterToViewProtocol {

    func showDetails(forUniversity university: University) {
        UniversityNameLabel.text = university.name
        universityStateLabel.text = university.state
        countryLabel.text = university.country
        countryCodeLabel.text = university.countryCode
        webpageButton.setTitle(university.webPage, for: .normal)
        url = university.webPage
    }
}
