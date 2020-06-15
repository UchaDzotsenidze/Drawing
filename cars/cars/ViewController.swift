//
//  ViewController.swift
//  cars
//
//  Created by Ucha Dzotsenidze on 5/1/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

class ViewController: UIViewController, carprotocol {
    
    func data(carname: String, carprice: String, carimage: String) {
        let insert = Car(image: carimage, Name: carname, Price: carprice)
        
        firstcararray.append(insert)
        FirstTableView.reloadData()
    }
    

    @IBOutlet weak var FirstTableView: UITableView!
    
    
    var firstcararray: [Car] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirstTableView.delegate = self
        FirstTableView.dataSource = self
        
    }

    @IBAction func onClick(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secView = storyboard.instantiateViewController(identifier: "SecondStoryboard")
        
        if let vc = secView as? SecondViewController{vc.delegate = self}
        
        self.navigationController?.pushViewController(secView, animated: true)
    }
    
    
    @IBAction func scrollDown(_ sender: UIButton) {
        
        let path = IndexPath(row: (firstcararray.count - 1),section: 0)
        FirstTableView.scrollToRow(at: path,  at: .bottom, animated: true)
        
    }
    
    @IBAction func scrollUp(_ sender: UIButton) {
        let path = IndexPath(row: 0, section: 0)
        FirstTableView.scrollToRow(at: path,  at: .top, animated: true)
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstcararray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath) as! FirstCellTableViewCell
        
        cell.FirstNameLabel.text = firstcararray[indexPath.row].Name
        cell.FirstPriceLabel.text = firstcararray[indexPath.row].Price
        cell.FirstImageView.image = UIImage(named: firstcararray[indexPath.row].image)
        
        return cell
    }
    
    
}

