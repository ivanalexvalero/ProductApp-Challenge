//
//  StyleCellView.swift
//  ProductApp-Challenge
//
//  Created by Ivan Valero on 23/08/2022.
//

import Foundation
import UIKit


class StyleCellView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        SetupView()
    } 
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
        SetupView()
        
    }
    
    private func SetupView() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 4
        layer.shadowOpacity = 0.1
    }
}
