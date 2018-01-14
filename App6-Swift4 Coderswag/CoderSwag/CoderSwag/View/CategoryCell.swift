//
//  CategoryCell.swift
//  CoderSwag
//
//  Created by My3 Shenoy on 13/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
   
    //MARK: Outlets
    @IBOutlet weak var categoryImgView: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    
    func updateViews(category: Category){
        categoryImgView.image = UIImage(named: category.imageName)
        categoryTitle.text = category.title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
