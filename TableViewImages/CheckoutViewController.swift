//
//  CheckoutViewController.swift
// 2018 Fortune Munyai
//
//  Created by 2018 Fortune Munyai
//  Copyright © 2018 Fortune Munyai All rights reserved.
//

import UIKit
import CoreData

class CheckoutViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 var totalCartAmountAll = UserDefaults.standard.integer(forKey: "tot")
    let moc = DataController().managedObjectContext;
    var listItems = [NSManagedObject]();
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalCartAmount: UILabel!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var deliveryPriceNumber: UILabel!
    
    var allProductsTotal:Int!
       
    var deliveryPrice = 250
    
    override func viewDidLoad() {
        title = " Confirm Order "
        UserDefaults.standard.integer(forKey: "tot")
        
        // Retrieve the data from Core Data
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item");
        
        do{
            let results = try moc.fetch(fetchRequest);
            listItems = results as! [NSManagedObject];
        }
        catch{
            print("Data did not Retrieve");
        }
        // Refresh tableView
        self.tableView.reloadData();
        
        // MARK: - Buttons navigation
        // Home Button
        let cartButton = UIBarButtonItem(image: UIImage(named: "home30"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(CheckoutViewController.homeScreen));
        
        self.navigationItem.rightBarButtonItem = cartButton;
        
        totalCartAmount.text = "R \(String(totalCartAmountAll))"
    }
    
    // Go to Home screen
    func homeScreen(){
        let homeScreen = storyboard?.instantiateViewController(withIdentifier: "categories view") as! TableViewController;
        navigationController?.show(homeScreen, sender: self);
    }
    
    // Showing us the data that saved from the previous screen
    override func viewWillAppear(_ animated: Bool) {
        
        // Retrieve the data from Core Data
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item");
     
        
        
        
        do{
            let results = try moc.fetch(fetchRequest);
            listItems = results as! [NSManagedObject];
        
        }
        catch{
            print("Data didn not Retrieve");
        }
        
        // Refresh tableView
        self.tableView.reloadData();
        
        for i in 0 ..< listItems.count {
            print("ListItems\(i): \(listItems[i])")
        }
        
        //Get Total Amount from Shopping Cart UIView Controller
        //let storyboard: UIStoryboard = UIStoryboard.init(name: "Main",bundle: nil);
        //let firstViewController = storyboard.instantiateViewController(withIdentifier: "shopping cart view") as! ShoppingCartViewController;
        
        //allProductsTotal =  firstViewController.totalAmount
        let me = UserDefaults.standard.integer(forKey: "tot")
        totalCartAmount.text = "R \(String(me + deliveryPrice))"
    }

    // MARK: - TableView display
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutViewCell", for: indexPath) as! CheckoutViewCell
        
        // Pull the data from the database and display it in the cell
        let item = listItems[indexPath.row] as! Item;
        let itemname = item.name
       UserDefaults.standard.set(itemname, forKey: "fortune")
        
    //UserDefaults.standard.set(itemname, forKey: "itemName")
        print(itemname)
        //cell.title.text = carmake[indexPath.item + 1] + carmake[indexPath.item + 2]
        cell.SetProductAttribute(item)
        
        return cell
    }
    
    // MARK: - Swich Button
    @IBAction func ShippingOption(_ sender: AnyObject) {
        // When it's on delivery fees will be added to the total price
        
        var total = 0
        if switchButton.isOn{
           // totalCartAmount.text = "R \(String(allProductsTotal + deliveryPrice))"
            deliveryPriceNumber.alpha = 1;
           total = totalCartAmountAll + deliveryPrice
            totalCartAmount.text = "R \(String(total))"
            
            UserDefaults.standard.set(total, forKey: "totalCartAmountAll")
        }else{
           // totalCartAmount.text = "R \(String(allProductsTotal))"
            total = totalCartAmountAll
            UserDefaults.standard.set(total, forKey: "totalCartAmountAll")
            totalCartAmount.text = "R \(String(total))"
           // deliveryPriceNumber.alpha = 0.2;
        }
        
        
        
    }
    
    
}
