//
//  ProductViewCell.swift
//  ProductApp-Challenge
//
//  Created by Ivan Valero on 23/08/2022.
//

import UIKit
import Kingfisher

class ProductViewCell: UITableViewCell {
    
    static let kId = "ProductViewCell"

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func  SetUpCell(model: Drinks.ResultDrinks) {
        productNameLabel.text = model.strDrink
        print("Name", productNameLabel.text)
    }
    
}
