//
//  RepoHeaderView.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 30.1.24..
//

import UIKit

class RepoHeaderView: BaseView {
    @IBOutlet var userAvatarImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var repoNameLabel: UILabel!
    @IBOutlet var forksCountLabel: UILabel!
    @IBOutlet var watchersCountLabel: UILabel!
    
    var presenter: RepoHeaderPresenter? {
        didSet {
            setUpUI()
            setData()
        }
    }

    private func setUpUI() {
        userAvatarImageView.layer.cornerRadius = 10.0
        userAvatarImageView.layer.masksToBounds = true
        layoutIfNeeded()
    }
    
    private func setData() {
        guard let presenter = presenter else { return }
        loadAvatarImage(from: presenter.getRepoUserAvatarUrl())
        userNameLabel.text = presenter.getRepoUserName()
        repoNameLabel.text = presenter.getRepoName()
        forksCountLabel.text = presenter.getRepoForksCountString()
        watchersCountLabel.text = presenter.getRepoForksCountString()
    }
    
    private func loadAvatarImage(from url: String) {
        //SDWebImage wont work for some reason, so here's another solution :)
        
        DispatchQueue.global(qos: .userInteractive).async {
            guard let url = URL(string: url),
                  let data = try? Data(contentsOf: url)
            else { return }
            DispatchQueue.main.async {
                self.userAvatarImageView.image = UIImage(data: data)
            }
        }
    }
}
