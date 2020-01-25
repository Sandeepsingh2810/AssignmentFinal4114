//
//  ProductTableVC.swift
//  AssignmentFinal4114
//
//  Created by Sandeep Jangra on 2020-01-24.
//  Copyright © 2020 Sandeep. All rights reserved.
//

import UIKit
import CoreData
class ProductTableViewController: UITableViewController {
var products : [Products]?

     var temp = Singleton.getInstance()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        temp.createProduct()
 //       print(temp.returnProductObj())
        products = temp.returnProductArray()
       saveCoreData()
        tableView.reloadData()
    }
    
    
    func saveCoreData(){
//    clearCoreData()
         let appDelegate = UIApplication.shared.delegate as! AppDelegate

         let managedContext = appDelegate.persistentContainer.viewContext
         
         for  product in products!
         {
             let productEntity = NSEntityDescription.insertNewObject(forEntityName: "Product", into: managedContext)
             productEntity.setValue(product.Product_Name, forKey: "name")
           // print(product.Product_Name)
             productEntity.setValue(product.Product_Description, forKey: "desc")
              productEntity.setValue(product.Product_Id, forKey: "id")
              productEntity.setValue(product.Product_Price, forKey: "price")
             
             // save context
             do{
                 try managedContext.save()
             }catch{
                 print(error)
             }
         }
     }
     
    
    
    func loadCoreData(){
        products = [Products]()
       saveCoreData()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
       
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        
        do{
            let results = try managedContext.fetch(fetchRequest)
            if results is [NSManagedObject]{
                for result in results as! [NSManagedObject]{
                    let name = result.value(forKey: "name") as! String
                    let desc = result.value(forKey: "desc") as! String
                    let id = result.value(forKey: "id") as! Int
                    let price = result.value(forKey: "price") as! Int
                    products?.append(Products(ProductName: name, Product_Description: desc, Product_Price: price, Product_Id: id))
                }
            }
        }catch{
            print(error)
        }
        
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products?.count ?? 0
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let product = products![indexPath.row]
               let cell = tableView.dequeueReusableCell(withIdentifier: "productCell")
               cell?.textLabel?.text = "\(product.Product_Id)" + " - " + "\(product.Product_Name)"
        cell?.detailTextLabel?.text = "\(product.Product_Description) - \(product.Product_Price)"
        
               return cell!
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
