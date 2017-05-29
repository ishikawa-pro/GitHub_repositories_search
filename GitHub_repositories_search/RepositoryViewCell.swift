//
//  RepositoryViewCell.swift
//  GitHub_repositories_search
//
//  Created by 石川諒 on 2017/05/29.
//  Copyright © 2017年 石川諒. All rights reserved.
//

import UIKit

class RepositoryViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //titleLabelを複数行表示にする
        self.titleLabel.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //値をセットする関数
    func setCell(title: String, discription: String) -> Void {
        self.titleLabel.text = title
        self.discriptionLabel.text = discription
        
        //titleLabelのサイズを調整
        self.titleLabel.sizeToFit()
    }

}
