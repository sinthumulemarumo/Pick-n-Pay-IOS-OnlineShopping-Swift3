//
//  RegisterViewController.swift
//  Pick'n'Pay
//
//  Created by Reverside Software Solutions on 2018/06/14.
//  Copyright © 2018 NisoLevy. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var lastNamelTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var residentialAddressTextField: UITextField!
    @IBOutlet weak var contactNumberTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "LoginPageViewController") as! LoginPageViewController;
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        
        let lastNamel = lastNamelTextField.text;
        let firstName = firstNameTextField.text;
        let password = passwordTextField.text;
        let emailAddress = emailAddressTextField.text;
        let residentialAddress = residentialAddressTextField.text;
        let contactNumber = contactNumberTextField.text;
        let repeatPassword = repeatPasswordTextField.text;
        let userName = userNameTextField.text;
        
        //Check for Empty fields
        if(lastNamel!.isEmpty || firstName!.isEmpty || emailAddress!.isEmpty || residentialAddress!.isEmpty || contactNumber!.isEmpty || password!.isEmpty || repeatPassword!.isEmpty || userName!.isEmpty){
            
            //Display Alert message
            displayMyAlertMessage(userMessage:"All Fields Are Required");
            
            return;
        }
        
        //Check if Password Matches
        if(password != repeatPassword){
            
            //Display Alert Message
            
            displayMyAlertMessage(userMessage:"Password Does not Match");
            
            return;
        }
        
        //Store data to MYSQL Database
        let myURL = NSURL(string: "https://leary-bricks.000webhostapp.com/RegisterFinalIOS.php")
        let request = NSMutableURLRequest(url: myURL! as URL)
       request.httpMethod = "POST"
        let postString = "firstName=\(firstName) &lastName=\(lastNamel) &password=\(password) &emailAddress=\(emailAddress) &resAddress=\(residentialAddress) &contactNumber=\(contactNumber) &userName=\(userName)"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
       let task = URLSession.shared.dataTask(with: request as URLRequest){
        data, response, error in
            
            if  error != nil{
                print("error = \(String(describing: error))")
               return
          }
        
        print("response =\(String(describing: response))")
        let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
        print("ResponseString =\(String(describing: responseString))")
        
            
            
       }
        task.resume()
        
        
        
        
        //UserDefaults.standard.set(userName, forKey: "userName");
       // UserDefaults.standard.set(lastNamel, forKey: "lastNamel");
       // UserDefaults.standard.set(firstName, forKey: "firstName") ;
       // UserDefaults.standard.set(password, forKey: "password");
       // UserDefaults.standard.set(emailAddress, forKey: "emailAddress");
       // UserDefaults.standard.set(residentialAddress, forKey: "residentialAddress");
       // UserDefaults.standard.set(contactNumber, forKey: "contactNumber");
       // UserDefaults.standard.set(contactNumber, forKey: "repeatPassword");
       // UserDefaults.standard.synchronize();
       // for (key, value) in UserDefaults.standard.dictionaryRepresentation() {
       //     print("\(key) = \(value) \n")
       // }
        
        
        
        
        //Display Confirmation Message
        var myAlert = UIAlertController(title: "Alert", message: "Registration is Successful. Thank You", preferredStyle:UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default){ action in
           self.dismiss(animated: true , completion: nil)
            
        };
        
        myAlert.addAction(okAction);
       self.present(myAlert, animated: true, completion: nil);
        
    }
    func displayMyAlertMessage(userMessage:String) -> String {
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle:UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil);
        
        myAlert.addAction(okAction);
        
        self.present(myAlert, animated: true, completion: nil);
        
        return userMessage;
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
