//
//  WelcomViewController.swift
//  2018 Fortune Munyai
//
//  Created by 2018 Fortune Munyai
//  Copyright © 2018 Fortune Munyai. All rights reserved.
//

import UIKit

class WelcomViewController: UIViewController {

    @IBAction func welcomeButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "LoginPageViewController") as! LoginPageViewController;
        self.present(secondViewController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        
    }
    
}
