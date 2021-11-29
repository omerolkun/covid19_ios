//
//  ViewController.swift
//  covid20_survey
//
//  Created by macbook on 29.11.2021.
//

import UIKit
import DropDown
import SCLAlertView
class ViewController: UIViewController {
    
    //name surname input
    @IBOutlet weak var name_surname:UITextField!
    
    
    @IBOutlet weak var vwDropdDown:UIView!
    @IBOutlet weak var lb1title:UILabel!
    
    @IBOutlet var myButton: UIButton!
    
    
    
    let dropDown = DropDown()
    let dropDownValues = ["omer","berdan"]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lb1title.text = "Select a city"
        // Do any additional setup after loading the view.
        dropDown.anchorView = vwDropdDown
        dropDown.dataSource = dropDownValues
        //sdfgdhgfghgfgdgfhgdgtgfhg
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.lb1title.text = dropDownValues[index]
        }
        
        
        


        
    }
    
    func check_len_name_surname(name: String)->Bool{
        if name.count < 5{
            return false
        }
        return true
    }
    
    
    
    @IBAction func showCities(_ sender:Any){
        dropDown.show()
    }
    
    
    @IBAction func didTapButton(_ sender:Any){
        let x = name_surname.text!
        SCLAlertView().showInfo("Result", subTitle: x)
    }
    
    
}

