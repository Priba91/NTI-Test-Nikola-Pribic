//
//  RepoDetailsViewController.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 30.1.24..
//

import Foundation
import UIKit

class RepoDetailsViewController: BaseViewController, RepoDetailsViewDelegate {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var emptyListLabel: UILabel!
    
    var presenter: RepoDetailsPresenter?
    let verticalTextTableViewCellIdentifier = "VerticalTextTableViewCell"
    let repoHeaderHeight = 200.0

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        getData()
    }
    
    private func setUpUI() {
        navigationController?.navigationBar.isHidden = false
        setUpTableView()
        emptyListLabel.text = "There is no tags for this repo.".localized()
    }
    
    private func setUpTableView() {
        tableView.register(UINib(nibName: verticalTextTableViewCellIdentifier, bundle: Bundle.main), forCellReuseIdentifier: verticalTextTableViewCellIdentifier)
    }
    
    private func getData() {
        showLoader()
        presenter?.fetchRepoTags()
    }
    
    func updateUI(repoTags: [RepoTag]?) {
        hideLoader()
        showEmptyLabelIfNeeded()
        tableView.reloadData()
    }
    
    private func showEmptyLabelIfNeeded() {
        guard let presenter = presenter else { return }
        emptyListLabel.isHidden = presenter.getRepoTags().count > 0
    }
    
    func showError(error: APIError) {
        hideLoader()
        showErrorAlert(error: error) { _ in
            self.getData()
        }
    }
    
    private func getHeaderView() -> UIView? {
        guard let presenter = presenter else { return nil }
        let headerView = RepoHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: repoHeaderHeight))
        headerView.presenter = RepoHeaderPresenter(repo: presenter.presentedRepo, user: presenter.user)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        return headerView
    }
    
    private func getHeaderViewHeight() -> CGFloat {
        guard let presenter = presenter
        else { return 0.0 }
        return repoHeaderHeight
    }
    
    private func getRepoTagCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard let repoTagCell = tableView.dequeueReusableCell(withIdentifier: verticalTextTableViewCellIdentifier, for: indexPath) as? VerticalTextTableViewCell,
              indexPath.row < presenter?.getRepoTags().count ?? 0,
              let presenter = presenter
        else { return UITableViewCell() }
        repoTagCell.presenter = RepoTagVerticalTextCellPresenter(repoTag: presenter.getRepoTags()[indexPath.row])
        return repoTagCell
    }
}

extension RepoDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getRepoTags().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getRepoTagCell(for: tableView, at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return getHeaderView()
    }
}
