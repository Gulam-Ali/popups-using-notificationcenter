//
//  SecondViewController.swift
//  reusablecustompopup
//
//  Created by gulam ali on 03/12/17.
//  Copyright © 2017 gulam ali. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var settingdate: UILabel!
    
     var observerremover : NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // observing notification...
        
        observerremover = NotificationCenter.default.addObserver(forName: .savedatetime, object: nil, queue: OperationQueue.main) { (notification) in
            let datevc = notification.object as! popupViewController
            self.settingdate.text = datevc.dataformatted
        }
    }
    
    // thebelow method to remove observer
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if let observer = observerremover {
            NotificationCenter.default.removeObserver(observer)
        }
        
    }


}

