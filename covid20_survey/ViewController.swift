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
    //gender buttons
    @IBOutlet weak var male_button:UIButton!
    @IBOutlet weak var female_button:UIButton!
    var choice_sex = "No gender is selected"
    
    
    //endof gender buttons
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
    // functions for name surname
    func check_len_name_surname(name: String)->Bool{
        if name.count < 5{
            return false
        }
        return true
    }
    //endof functions for name surname
    
    // functions for genders
    @IBAction func select_male(_ sender: Any){
        male_button.setTitle("*MALE*", for: .normal)
        female_button.setTitle("Female",for: .normal)
    }
    @IBAction func select_female(_ sender: Any){
        female_button.setTitle("*FEMALE*",for: .normal)
        male_button.setTitle("Male",for: .normal)
    }
    
    @IBAction func which_gender(_ sender: Any){
        let fem = female_button.currentTitle
        let mal = male_button.currentTitle
        
        if fem == "Female" && mal == "Male"{
            choice_sex = "You need to select a gender" // this means no gender is selected and it is invalid
        }else{
            choice_sex = ""
        }
    }
    
    
    // endof functions for genders
    
    
    @IBAction func showCities(_ sender:Any){
        dropDown.show()
    }
    
    
    @IBAction func didTapButton(_ sender:Any){
        let x = name_surname.text!
        SCLAlertView().showInfo("Result", subTitle: choice_sex)
    }
    
    
}

