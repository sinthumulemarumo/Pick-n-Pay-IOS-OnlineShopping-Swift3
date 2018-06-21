//
//  CheckoutViewCell.swift
// 2018 Fortune Munyai
//
//  Created by 2018 Fortune Munyai
//  Copyright © 2018 Fortune Munyai. All rights reserved.
//

import UIKit

class CheckoutViewCell: UITableViewCell {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productQuantity: UILabel!
    
    var productTotalAmount:Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func SetProductAttribute(_ item:Item){
        
        productName.text = item.name
        
        let itemPrice = item.roundPrice as! Int
        let itemQty = item.qty as! Int
        productTotalAmount = itemPrice * itemQty
        productPrice.text = "R \(String(productTotalAmount))"
        
        productQuantity.text = String(describing: item.qty!)
    }

}
