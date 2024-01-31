//
//  UserReposViewController.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 30.1.24..
//

import UIKit

class UserReposViewController: BaseViewController, UserReposViewDelegate {
    @IBOutlet var tableView: UITableView!

    lazy var presenter = UserReposPresenter(self, networkClient: NetworkClient())
    let horisontalTextTableViewCellIdentifier = "HorisontalTextTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        getData()
    }
    
    private func setUpUI() {
        title = "user_repos_title".localized()
        setUpTableView()
    }
    
    private func setUpTableView() {
        tableView.register(UINib(nibName: horisontalTextTableViewCellIdentifier, bundle: Bundle.main), forCellReuseIdentifier: horisontalTextTableViewCellIdentifier)
    }
    
    private func getData() {
        showLoader()
        presenter.fetchData()
    }
    
    func updateUI(repos: [Repo]?) {
        hideLoader()
        tableView.reloadData()
    }
    
    func showError(error: APIError) {
        hideLoader()
        showErrorAlert(error: error) { _ in
            self.getData()
        }
    }
    
    private func getUserRepoCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard let userRepoCell = tableView.dequeueReusableCell(withIdentifier: horisontalTextTableViewCellIdentifier, for: indexPath) as? HorisontalTextTableViewCell,
              indexPath.row < presenter.getUserRepos().count
        else { return UITableViewCell() }
        userRepoCell.presenter = UserRepoHorisontalTextCellPresenter(repo: presenter.getUserRepos()[indexPath.row])
        return userRepoCell
    }
    
    private func pushRepoDetailsViewControler(for indexPath: IndexPath) {
        guard indexPath.row < presenter.getUserRepos().count else { return }
        guard let repoDetailsViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "RepoDetailsViewController") as? RepoDetailsViewController else { return }
        repoDetailsViewController.presenter = RepoDetailsPresenter(view: repoDetailsViewController, presentedRepo: presenter.getUserRepos()[indexPath.row], user: presenter.getUser())
        navigationController?.pushViewController(repoDetailsViewController, animated: true)
    }
}

extension UserReposViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getUserRepos().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getUserRepoCell(for: tableView, at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < presenter.getUserRepos().count else { return }
        pushRepoDetailsViewControler(for: indexPath)
    }
    
}
