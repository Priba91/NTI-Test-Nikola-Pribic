//
//  HorisontalTextTableViewCell.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 31.1.24..
//

import UIKit

class HorisontalTextTableViewCell: UITableViewCell {
    @IBOutlet var leftLabel: UILabel!
    @IBOutlet var rightLabel: UILabel!
    
    var presenter: HorisontalTextCellProtocol? {
        didSet {
            setData()
        }
    }
    
    private func setData() {
        guard let presenter = presenter else { return }
        leftLabel.text = presenter.getLeftText()
        rightLabel.text = presenter.getRightText()
    }
}
