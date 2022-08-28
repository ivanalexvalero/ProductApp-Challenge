//
//  DetailProductViewController.swift
//  ProductApp-Challenge
//
//  Created by Ivan Valero on 23/08/2022.
//

import UIKit
import Kingfisher

class DetailProductViewController: UIViewController {

    @IBOutlet weak var drinkImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var glassLabel: UILabel!
    @IBOutlet weak var alcoholicLabel: UILabel!
    @IBOutlet weak var instructionsENLabel: UILabel!
    @IBOutlet weak var instructionsESLabel: UILabel!
    
    
    
    
    private var name: String = ""
    private var image: String = ""
    private var category: String = ""
    private var glass: String = ""
    private var alcoholic: String = ""
    private var instructions: String = ""
    private var instructionsES: String = ""
    
    init(name: String, image: String, category: String, glass: String, alcoholic: String, instructions: String, instructionsES: String) {
        super.init(nibName: nil, bundle: nil)
        self.name = name
        self.image = image
        self.category = category
        self.glass = glass
        self.alcoholic = alcoholic
        self.instructions = instructions
        self.instructionsES = instructionsES
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
//        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = name
        
        SetupData()
    }

    private func SetupData() {
        
        if let url = URL(string: image) {
            drinkImage.kf.setImage(with: url)
        }
        nameLabel.text = name
        categoryLabel.text = "Category: \(category)"
        glassLabel.text = "Glass: \(glass)"
        alcoholicLabel.text = "Alcoholic: \(alcoholic)"
        instructionsENLabel.text = "Instructions: \(instructions)"
        instructionsESLabel.text = "InstructionsES: \(instructionsES)"
        
    }

}
