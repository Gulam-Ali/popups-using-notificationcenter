//
//  popupViewController.swift
//  reusablecustompopup
//
//  Created by gulam ali on 03/12/17.
//  Copyright © 2017 gulam ali. All rights reserved.
//

import UIKit

class popupViewController: UIViewController {
    
    
    @IBOutlet weak var selecttitle: UILabel!
    
    @IBOutlet weak var datepicker: UIDatePicker!
    
    @IBOutlet weak var savebutton: UIButton!
    
    var showtimepicker : Bool = false
    
    
    // now for gettingg data from popup to our view controller we will use notification center but before that we hav to change our date and time values in string becoz we've used labels to show date and time to do that we wrote these formatters below..
    
    var dataformatted : String {
        get {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            return formatter.string(from: datepicker.date)
        }
    }
    
    var timeformatted : String {
        get{
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter.string(from: datepicker.date)
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if showtimepicker{
            selecttitle.text = "Select Time"
            savebutton.setTitle("Save Time", for: .normal)
            datepicker.datePickerMode = .time
        }
    }
    
    @IBAction func savebutnACTION(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: .savedatetime, object: self)
        
        dismiss(animated: true)
        
    }
    
   
    
  

}
