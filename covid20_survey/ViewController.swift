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
    var city = ""
    
    //name surname input
    @IBOutlet weak var name_surname:UITextField!
    //endof name surname inputs
    
    // date variables
    @IBOutlet weak var birth_date_day:UITextField!
    
    @IBOutlet weak var birth_date_month:UITextField!
    @IBOutlet weak var birth_date_year:UITextField!
    
    var day = 0
    
    
    // endof date variables
    
    //city variables
    @IBOutlet weak var vwDropdDown:UIView!
    @IBOutlet weak var lb1title:UILabel!
    
    //endof city variables
    
    
    //gender buttons and variables
    @IBOutlet weak var male_button:UIButton!
    @IBOutlet weak var female_button:UIButton!
    var choice_sex = "Gender is not selected!"
    
    
    //endof gender buttons
    @IBOutlet var myButton: UIButton!
    
    
    
    let dropDown = DropDown()
    let dropDownValues = [ "ADANA", "ADIYAMAN", "AFYONKARAHİSAR", "AĞRI", "AMASYA", "ANKARA",
                           "ANTALYA", "ARTVİN", "AYDIN", "BALIKESİR", "BİLECİK", "BİNGÖL", "BİTLİS", "BOLU", "BURDUR",
                           "BURSA", "ÇANAKKALE", "ÇANKIRI", "ÇORUM", "DENİZLİ", "DİYARBAKIR", "EDİRNE", "ELAZIĞ",
                           "ERZİNCAN", "ERZURUM", "ESKİŞEHİR", "GAZİANTEP", "GİRESUN", "GÜMÜŞHANE", "HAKKARİ",
                           "HATAY", "ISPARTA", "MERSİN", "İSTANBUL", "İZMİR", "KARS", "KASTAMONU", "KAYSERİ",
                           "KIRKLARELİ", "KIRŞEHİR", "KOCAELİ", "KONYA", "KÜTAHYA", "MALATYA", "MANİSA",
                           "KAHRAMANMARAŞ", "MARDİN", "MUĞLA", "MUŞ", "NEVŞEHİR", "NİĞDE", "ORDU", "RİZE", "SAKARYA",
                           "SAMSUN", "SİİRT", "SİNOP", "SİVAS", "TEKİRDAĞ", "TOKAT", "TRABZON", "TUNCELİ", "ŞANLIURFA",
                           "UŞAK", "VAN", "YOZGAT", "ZONGULDAK", "AKSARAY", "BAYBURT", "KARAMAN", "KIRIKKALE",
                           "BATMAN", "ŞIRNAK", "BARTIN", "ARDAHAN", "IĞDIR", "YALOVA", "KARABÜK", "KİLİS", "OSMANİYE",
                           "DÜZCE"]
   
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        lb1title.text = "Select a city"
        // Do any additional setup after loading the view.
        dropDown.anchorView = vwDropdDown
        dropDown.dataSource = dropDownValues
        //sdfgdhgfghgfgdgfhgdgtgfhg
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.lb1title.text = dropDownValues[index]
            city = dropDownValues[index]
            print(city)
        }
        
        //print(lb1title.text!)
        
        
        


        
    }
    // functions for name surname
    func check_len_name_surname(name: String)->Bool{
        if name.count < 5{
            return false
        }
        return true
    }
    
    func check_missing_surname(name: String)->Bool{
        if name.contains(" "){
            return true
        }
        return false
    }
    
    //endof functions for name surname
    
    //date control functions
    func check_day() -> Bool {
        
        day = Int(birth_date_day.text ?? "") ?? -100
        print(day)
        
        if day < 1 || day > 31{
            return false
        }
        
        return true
       
    }
    
    
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
    
    //city functions
    @IBAction func showCities(_ sender:Any){
        dropDown.show()
    }
    
    func check_city_selected()-> Bool{
        if city == "" {
            return false
        }
        return true
    }
    
    
    
    //endof city functions
    @IBAction func didTapButton(_ sender:Any){
        var  result_message = ""
        var str_name_surname = name_surname.text!
        
        if check_len_name_surname(name: str_name_surname) == false{
            result_message = result_message + "Invalid name surname length\n"
        }
        if check_len_name_surname(name: str_name_surname) == true{
            if check_missing_surname(name: str_name_surname) == false{
                result_message = result_message + "Missing Surname!\n"
            }
        }
        
        if check_day() == false {
            result_message = result_message + "Invalid day!\n"
        }
        
        if check_city_selected() == false {
            result_message = result_message + "City is not selected!\n"
        }
        result_message = result_message + choice_sex
        SCLAlertView().showInfo("Result", subTitle: result_message)
    }
    
    
}

