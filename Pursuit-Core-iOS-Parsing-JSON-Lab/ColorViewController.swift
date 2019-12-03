//
//  ColorViewController.swift
//  Pursuit-Core-iOS-Parsing-JSON-Lab
//
//  Created by Maitree Bain on 11/26/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet weak var colorTableView: UITableView!
    
    var color = [Colors]() {
        didSet {
            colorTableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        colorTableView.dataSource = self
        loadData()
        colorTableView.delegate = self
    }


    func loadData() {
        color = ColorDataLoad.getColorInfo()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorDetailVC = segue.destination as? ColorDetailViewController,
            let indexPath = colorTableView.indexPathForSelectedRow else {
            fatalError("no segue found")
        }
        let colorSelected = color[indexPath.row]
        
        colorDetailVC.color = colorSelected
    }
}

extension ColorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return color.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        let colorPicked = color[indexPath.row]
        cell.textLabel?.text = colorPicked.name.value
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(colorPicked.rgb.r / 255), green: CGFloat(colorPicked.rgb.g / 255), blue: CGFloat(colorPicked.rgb.b / 255), alpha: 1)
        
        if colorPicked.name.value == "Cod Gray" {
            cell.textLabel?.textColor = .white
        }
        
        return cell
    }
}

extension ColorViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
