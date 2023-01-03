//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

//UItextField Dlegate to be able to access our keyboard to be Able to hit go and it searches
class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet var searchField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //Tap in and alter our search field bar, and access the property:Delegate, and set it to this current class = the use of 'self' - MEANING our text field should report back to our view controller, which  lets the view controller know what is going on and communicates. The way we make sure the vc is notified by search field, is by setting the vc as the Delegate - Self refers to Current VC
        searchField.delegate = self
    }


    @IBAction func searchButton(_ sender: UIButton) {
        //how to stop the keyboard from typing in search box once you are dpone typing
        searchField.endEditing(true)
       print(searchField.text!)
    }
    
    
    // ask should the pressing of the Return button on keyboard to be processed
    // this will print to our console what was typed in, and also, due to the "-> Bool" we must return a true or false value
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchField.endEditing(true)
        print(searchField.text!)
        //handles the return of Bool to satisfy function requirements
        return true
    }
    
    
    
    
    func textFieldShouldEndEditing(_ searchField: UITextField) -> Bool {
        //this is saying if the Text inside of the text box DOES NOT = empty
        if searchField.text != "" {
            //then return true, which says yes this should End Editing
            return true
            // if that is not the case, our else statement handles if it is empty
        } else {
            //A placeholder will pop up to remind user to enter something
            searchField.placeholder = "Type the location"
            //false = no and will continue to edit
            return false
        }
    }
    
    //delegate method to know to clear the text field after someone types and searches.
    func textFieldDidEndEditing(_ textField: UITextField) {
        //use searchField.text ---to get the weather for that city
        
        
        searchField.text = ""
    }
    
}

