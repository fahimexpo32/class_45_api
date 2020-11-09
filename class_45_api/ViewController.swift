//
//  ViewController.swift
//  class_45_api
//
//  Created by fahim expo on 7/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textDataInput: UITextField!
    
    @IBOutlet weak var countryName: UILabel!
    var dataconnectionapi = DataConnectionApi()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
    }

    
    @IBAction func actionButton(_ sender: UIButton) {
        
        if let textBuindin  = textDataInput.text {
            dataconnectionapi.watherFunc(city: "\(textBuindin)")
        }
        
       
       
    }
    
    func showCuntryName(temp: JsonModel) {
        DispatchQueue.main.async {
            self.countryName.text = String(temp.tempShow)
        }
       
    }
    
}

