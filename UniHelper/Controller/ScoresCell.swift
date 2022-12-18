//
//  ScoresCell.swift
//  UniHelper
//
//  Created by Danila Belyi on 07.12.2022.
//

import UIKit

class ScoresCell: UITableViewCell {
    let title: UILabel = {
        let text = UILabel()
        return text
    }()
    
    let scoresTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.addSubview(title)
        contentView.addSubview(scoresTextField)
    }
    
//    func setupConstraints() {
//        title.leftAnchor(
//    }
}
