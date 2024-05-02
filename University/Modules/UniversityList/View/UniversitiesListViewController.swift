//
//  ArticleListViewController.swift
//  University
//
//  Created by Sharaf on 5/1/24.


import UIKit

final class UniversitiesListViewController: UIViewController {

    // MARK: - IBOutlets -
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Public properties -
    
    var presenter: UniversitiesListViewToPresenterProtocol!
    
    // MARK: - Private properties -
    
    private let refreshControl = UIRefreshControl()

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewAndRefreshControl()
        presenter.viewDidLoad()
    }
    

    func setupTableViewAndRefreshControl() {
        tableView.register(UINib(nibName: "UniversityTableViewCell", bundle: nil), forCellReuseIdentifier: "UniversityTableViewCell")
        tableView.refreshControl = refreshControl
        refreshControl.tintColor = UIColor.yellow
        refreshControl.addTarget(self, action: #selector(refreshArticleList(_:)), for: .valueChanged)
    }
    
    @objc private func refreshArticleList(_ sender: Any) {
        presenter.viewDidLoad()
    }
}

// MARK: - View Interface -
extension UniversitiesListViewController: UniversitiesListPresenterToViewProtocol {

    func showErrorMessage(_ errorMessage: String) {
        hideActivityIndicator()
        refreshControl.endRefreshing()
        let alertController: UIAlertController = UIAlertController(title: "error", message: errorMessage, preferredStyle: .alert)
               let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
               alertController.addAction(okAction)
               present(alertController, animated: true, completion: nil)
    }
    
    func reloadDate() {
        tableView.reloadData()
        refreshControl.endRefreshing()
        hideActivityIndicator()
    }
}

// MARK: - TableView Data Source -
extension UniversitiesListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.universitiesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UniversityTableViewCell", for: indexPath) as! UniversityTableViewCell
        let university = presenter.universities[indexPath.row]
        cell.configure(university)
        return cell
    }
}

// MARK: - TableView Delegate -
extension UniversitiesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let university = presenter.universities[indexPath.row]
        
        presenter.didSelectUniversity(university)
    }
}
