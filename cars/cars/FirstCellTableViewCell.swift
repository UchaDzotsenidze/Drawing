//
//  FirstCellTableViewCell.swift
//  cars
//
//  Created by Ucha Dzotsenidze on 5/1/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

class FirstCellTableViewCell: UITableViewCell {

    @IBOutlet weak var FirstImageView: UIImageView!
    @IBOutlet weak var FirstNameLabel: UILabel!
    @IBOutlet weak var FirstPriceLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
}
