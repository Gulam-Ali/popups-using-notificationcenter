//
//  thirdscreenViewController.swift
//  reusablecustompopup
//
//  Created by gulam ali on 03/12/17.
//  Copyright © 2017 gulam ali. All rights reserved.


// this screen is for show time picker not date

import UIKit

class thirdscreenViewController: UIViewController {
    
    
    @IBOutlet weak var settingtIme: UILabel!
    
     var observerremover : NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // observing notification...
        
        observerremover = NotificationCenter.default.addObserver(forName: .savedatetime, object: nil, queue: OperationQueue.main) { (notification) in
            let datevc = notification.object as! popupViewController
            self.settingtIme.text = datevc.timeformatted
        }
    }
    
    // thebelow method to remove observer
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if let observer = observerremover {
            NotificationCenter.default.removeObserver(observer)
        }
        
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "topopupfortime"{
            
            let timepop = segue.destination as! popupViewController
            timepop.showtimepicker = true
            
            
            
        }
    }
    
    
}
