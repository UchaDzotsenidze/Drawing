//
//  SecondViewController.swift
//  cars
//
//  Created by Ucha Dzotsenidze on 5/1/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

protocol carprotocol{
    func data(carname: String, carprice: String, carimage: String)
}



class SecondViewController: UIViewController {
    
    @IBOutlet weak var SecondNameField: UITextField!
    
    @IBOutlet weak var SecondPriceField: UITextField!
    
    @IBOutlet weak var SecondTableView: UITableView!
    
    
    var carimages = ["bmw", "ferrari", "koenigsegg"]
    
    //var arrayofcars: [Car] = []
    
    var tappedindex = 0
    
    var delegate : carprotocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SecondTableView.delegate = self
        SecondTableView.dataSource = self
    }
    

    @IBAction func onClick(_ sender: UIButton) {
        let gotName = SecondNameField.text
        let gotPrice = SecondPriceField.text
        
        let z = carimages[tappedindex]
        delegate?.data(carname: gotName!, carprice: gotPrice!, carimage: z)
        
        self.navigationController?.popViewController(animated: true)
    }
    

}


extension SecondViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carimages.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondCell", for: indexPath) as! SecondTableViewCell
        
        cell.SecondImageView.image = UIImage(named: carimages[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tappedindex = indexPath.row
    }
}

