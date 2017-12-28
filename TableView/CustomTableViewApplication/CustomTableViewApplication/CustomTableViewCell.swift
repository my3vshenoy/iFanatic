//
//  CustomTableViewCell.swift
//  CustomTableViewApplication
//
//  Created by My3 Shenoy on 28/12/17.
//  Copyright © 2017 com.aarven. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var animalImgView: UIImageView!
    
    @IBOutlet weak var animalNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
