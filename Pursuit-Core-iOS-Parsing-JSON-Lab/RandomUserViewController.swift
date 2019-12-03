//
//  RandomUserViewController.swift
//  Pursuit-Core-iOS-Parsing-JSON-Lab
//
//  Created by Maitree Bain on 12/2/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

class RandomUserViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    
    var userData = [UserInfo]() {
        didSet{
            userTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userTableView.delegate = self
        userTableView.dataSource = self
        userData = RandomUserDataLoad.getUserInfo()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let randomUserVC = segue.destination as? RandomUserDetailController,
        let indexPath = userTableView.indexPathForSelectedRow else {
            fatalError("no segue found")
        }
        let userSelected = userData[indexPath.row]
        
        randomUserVC.user = userSelected
    }
    
}

extension RandomUserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension RandomUserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        
        let userPicked = userData[indexPath.row]
        cell.textLabel?.text = "\(userPicked.name.first) \(userPicked.name.last)"
        cell.detailTextLabel?.text = userPicked.email
        
        return cell
    }
    
    
}
