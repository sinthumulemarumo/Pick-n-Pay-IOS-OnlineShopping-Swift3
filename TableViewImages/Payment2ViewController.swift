//
//  Payment2ViewController.swift
//  Pick'n'Pay
//
//  Created by Reverside Software Solutions on 2018/06/22.
//  Copyright © 2018 NisoLevy. All rights reserved.
//

import UIKit
import CoreData

class Payment2ViewController: UIViewController {

    var array = [String]()
    @IBAction func homeBtnPressed(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyBoard.instantiateViewController(withIdentifier: "root view controller") as! UINavigationController
        self.present(navigationController, animated: true, completion: nil)
     
    }
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var productTextField: UITextView!
    @IBOutlet weak var zipTextField: UITextField!
    
    @IBOutlet weak var shippingTextField: UITextField!
    @IBOutlet weak var totalItemsTextField: UITextField!
    @IBOutlet weak var totalAmtTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
   
    @IBOutlet weak var firstNameTextField: UITextField!
  var listItems = [NSManagedObject]()
     let moc = DataController().managedObjectContext;
    override func viewDidLoad() {
        UserDefaults.standard.stringArray(forKey: "SavedStringArray")
        UserDefaults.standard.string(forKey: "fortune")
        UserDefaults.standard.string(forKey: "totalItems")
        UserDefaults.standard.string(forKey: "phone")
        UserDefaults.standard.string(forKey: "delivery")
        UserDefaults.standard.string(forKey: "email")
        UserDefaults.standard.string(forKey: "city")
        UserDefaults.standard.string(forKey: "zip")
        UserDefaults.standard.string(forKey: "totalCartAmountAll")
        UserDefaults.standard.synchronize()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item");
        
        do{
            let results = try moc.fetch(fetchRequest);
            listItems = results as! [NSManagedObject];
        }
        catch{
            print("Data did not Retrieve");
        }

        
        // Show the total quantity from Core Data when the view did Load
      
        for (name1) in listItems {
            array.append(name1.value(forKey: "name") as! String)
//            let itemQty = name1.value(forKey: "name") as! String
        }
        //print(array)
        UserDefaults.standard.set(array, forKey: "name1")
       
        
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Declare Varibles
     
        firstNameTextField.text = UserDefaults.standard.string(forKey: "Username")
        let m = UserDefaults.standard.string(forKey: "totalCartAmountAll")
        let toto = String("R \(m)");
        let tota = toto?.replacingOccurrences(of: "Optional(", with: "")
        let totu = tota?.replacingOccurrences(of: ")", with: "")
        let i = totu?.replacingOccurrences(of: "\"" , with: "")
        
        var productArray = UserDefaults.standard.string(forKey: "name1")
        print(array)
        var prodName = ""
        for name in array
        {
            prodName = prodName + name as String + "\n";
        }
        
        productTextField.text = prodName
        
        totalAmtTextField.text = i
       
//        productTextField.text = UserDefaults.standard.string(forKey: "name1")
        
        productTextField.layer.cornerRadius = 10
        totalItemsTextField.text = UserDefaults.standard.string(forKey: "totalItems")
        phoneTextField.text = UserDefaults.standard.string(forKey: "phone")
        shippingTextField.text = UserDefaults.standard.string(forKey: "delivery")
        emailTextField.text = UserDefaults.standard.string(forKey: "email")
        cityTextField.text = UserDefaults.standard.string(forKey: "city")
        zipTextField.text = UserDefaults.standard.string(forKey: "zip")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func paymentBtnPressed(_ sender: Any) {
        
        var productArray = UserDefaults.standard.string(forKey: "name1")
        print(array)
        var prodName = ""
        for name in array
        {
            prodName = prodName + name as String + "\n";
        }
        
         let username = UserDefaults.standard.string(forKey: "Username")
        let totalItems = UserDefaults.standard.string(forKey: "totalItems")
        let name = prodName
        let email = UserDefaults.standard.string(forKey: "email")
        let city = UserDefaults.standard.string(forKey: "city")
        //let zip = UserDefaults.standard.string(forKey: "zip")
        let totalAmt = UserDefaults.standard.string(forKey: "totalCartAmountAll")
        let phone = UserDefaults.standard.string(forKey: "phone")
        let ship = UserDefaults.standard.string(forKey: "delivery")
        
        
        
        let myURL = NSURL(string: "https://leary-bricks.000webhostapp.com/OrderItemIOS.php")
        let request = NSMutableURLRequest(url: myURL! as URL)
        request.httpMethod = "POST"
        let postString = "&totalAmt=\(String(describing: totalAmt)) &userName=\(String(describing: username)) &name=\(String(describing: name)) &email=\(String(describing: email)) &city=\(String(describing: city)) &phone=\(String(describing: phone)) &ship=\(String(describing: ship)) &totalitems=\(String(describing: totalItems))  "
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

            DispatchQueue.main.async{
                if(responseString == "New record created successfully"){

                   self.displayMyAlertMessage(userMessage:"Your Order was submitted Successful");

               }else {
                   self.displayMyAlertMessage(userMessage:"Please check PHP files and MyPHP Admin [Database]");
                }

            }
        }
       task.resume()
    }
  
    func displayMyAlertMessage(userMessage:String) -> String {
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle:UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil);
        
        myAlert.addAction(okAction);
        
        self.present(myAlert, animated: true, completion: nil);
        
        return userMessage;
        
        
    }
    
  

}
