//
//  ConfirmationViewController.swift
//  Pick'n'Pay
//
//  Created by Reverside Software Solutions on 2018/06/22.
//  Copyright © 2018 NisoLevy. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {

    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var deliveryTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitBtnPressed(_ sender: Any) {
        
        let zip = zipTextField.text
        let city = cityTextField.text
        let delivery = deliveryTextField.text
        let email = emailTextField.text
        let phone = phoneTextField.text
   UserDefaults.standard.set(zip, forKey: "zip")
        UserDefaults.standard.set(city, forKey: "city")
        UserDefaults.standard.set(delivery, forKey: "delivery")
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(phone, forKey: "phone")
    }
    


}
