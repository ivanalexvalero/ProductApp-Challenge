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
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var glassLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func  SetUpCell(model: Drinks.ResultDrinks) {
        
        if let imageUrl = model.strDrinkThumb as String?, let url = URL(string: "\(imageUrl)") {
            productImage.kf.setImage(with: url)
        }
        productNameLabel.text = model.strDrink
        categoryLabel.text = model.strCategory
        glassLabel.text = model.strGlass
//        print("Name", productNameLabel.text)
    }
    
}
