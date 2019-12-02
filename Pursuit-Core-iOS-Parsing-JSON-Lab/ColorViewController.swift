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
    }


    func loadData() {
        color = ColorDataLoad.getColorInfo()
    }
}

extension ColorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return color.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        let colorPicked = color[indexPath.row]
        cell.textLabel?.text = colorPicked.name
        
        return cell
    }
}
