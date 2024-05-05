//
//  SecondViewController.swift
//  machineTestTherd
//
//  Created by Macintosh on 19/01/24.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var streetLabel: UILabel!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var zipcodeLabel: UILabel!
    
    @IBOutlet weak var latlabel: UILabel!
    
    @IBOutlet weak var longLabel: UILabel!
    
    
    var UserContainer : User?
    override func viewDidLoad() {
        super.viewDidLoad()
     bindData()
    }
    func bindData(){
        self.cityLabel.text = UserContainer?.address.city.description.codingKey.stringValue
        self.streetLabel.text = UserContainer?.address.street.description.codingKey.stringValue
        self.numberLabel.text = UserContainer?.address.number.description.codingKey.stringValue
        self.zipcodeLabel.text = UserContainer?.address.zipcode.description.codingKey.stringValue
        self.latlabel.text = UserContainer?.address.geolocation.lat.description.codingKey.stringValue
        self.longLabel.text = UserContainer?.address.geolocation.long.description.codingKey.stringValue
    }

}
