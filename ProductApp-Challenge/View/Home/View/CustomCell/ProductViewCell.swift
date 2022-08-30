//
//  ProductViewCell.swift
//  ProductApp-Challenge
//
//  Created by Ivan Valero on 23/08/2022.
//

import UIKit
import Kingfisher
import SkeletonView

class ProductViewCell: UITableViewCell {
    
    static let kId = "ProductViewCell"

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var glassLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        SetUpSkeleton()
    }
    

    func SetUpCell(model: Drinks.ResultDrinks) {
        
        productNameLabel.showAnimatedGradientSkeleton()
        productNameLabel.linesCornerRadius = 8
        productImage.showAnimatedGradientSkeleton()
        categoryLabel.showAnimatedGradientSkeleton()
        categoryLabel.linesCornerRadius = 8
        glassLabel.showAnimatedGradientSkeleton()
        glassLabel.linesCornerRadius = 8
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            if let imageUrl = model.strDrinkThumb as String?, let url = URL(string: "\(imageUrl)") {
                self.productImage.kf.setImage(with: url)
            }
            self.productNameLabel.text = model.strDrink
            self.categoryLabel.text = model.strCategory
            self.glassLabel.text = model.strGlass
            
            
            self.productNameLabel.hideSkeleton()
            self.productImage.hideSkeleton()
            self.categoryLabel.hideSkeleton()
            self.glassLabel.hideSkeleton()
            
        }
        
        
//        print("Name", productNameLabel.text)
    }
    
    private func SetUpSkeleton() {
        isSkeletonable = true
        productImage.isSkeletonable = true
        productNameLabel.isSkeletonable = true
        categoryLabel.isSkeletonable = true
        glassLabel.isSkeletonable = true
    }
    
}
