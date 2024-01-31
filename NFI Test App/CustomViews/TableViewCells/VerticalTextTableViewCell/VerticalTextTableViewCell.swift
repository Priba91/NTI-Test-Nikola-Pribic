//
//  VerticalTextTableViewCell.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 31.1.24..
//

import UIKit

class VerticalTextTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var presenter: VerticalTextCellProtocol? {
        didSet {
            setData()
        }
    }
    
    private func setData() {
        guard let presenter = presenter else { return }
        titleLabel.text = presenter.getTitleText()
        descriptionLabel.text = presenter.getDescriptionText()
    }
}
