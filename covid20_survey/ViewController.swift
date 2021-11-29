//
//  ViewController.swift
//  covid20_survey
//
//  Created by macbook on 29.11.2021.
//

import UIKit
import DropDown


class ViewController: UIViewController {
    @IBOutlet weak var vwDropdDown:UIView!
    @IBOutlet weak var lb1title:UILabel!
    
    let dropDown = DropDown()
    let dropDownValues = ["omer","berdan"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dropDown.anchorView = vwDropdDown
        dropDown.dataSource = dropDownValues
        
    }
    
    @IBAction func showCities(_ sender:Any){
        dropDown.show()
    }

}

