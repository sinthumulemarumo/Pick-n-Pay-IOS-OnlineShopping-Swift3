//
//  ProductsViewCell.swift
//  2018 Fortune Munyai
//
//  Created by 2018 Fortune Munyai
//  Copyright © 2018 Fortune Munyai. All rights reserved.
//

import UIKit

class ProductsViewCell: UITableViewCell {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    
    func setCell(_ productName: String, productPrice: String, productImage: String)
    {
        self.productName.text = productName
        self.productPrice.text = productPrice
        self.productImage.image = UIImage(named: productImage)
    }

}
