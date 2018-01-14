//
//  ProductCell.swift
//  CoderSwag
//
//  Created by My3 Shenoy on 14/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var productPriceLbl: UILabel!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var productImgView: UIImageView!
    
    func updateViews(product: Product){
        productImgView.image = UIImage(named: product.imageName)
        productNameLbl.text = product.title
        productPriceLbl.text = product.price
    }
    
}
