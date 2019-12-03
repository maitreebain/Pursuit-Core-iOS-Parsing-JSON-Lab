//
//  ColorDetailViewController.swift
//  Pursuit-Core-iOS-Parsing-JSON-Lab
//
//  Created by Maitree Bain on 12/2/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {
    
    @IBOutlet weak var hexLabel: UILabel!
    
    @IBOutlet weak var rgbLabel: UILabel!
    
    var color: Colors?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hexLabel.text = "Hex Value: \(color?.hex.value ?? "")"
        rgbLabel.text = "RGB Values: \(color?.rgb.value ?? "")"
        
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(color!.rgb.r / 255), green: CGFloat(color!.rgb.g / 255), blue: CGFloat(color!.rgb.b / 255), alpha: 1)
    }
    

}
