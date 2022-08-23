//
//  ProductViewCell.swift
//  ProductApp-Challenge
//
//  Created by Ivan Valero on 23/08/2022.
//

import UIKit

class ProductViewCell: UITableViewCell {
    
    static let kId = "ProductsTableViewCell"

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func  SetUpCell(model: ModelProduct) {
        productNameLabel.text = model.nameProduct
    }
    
}
