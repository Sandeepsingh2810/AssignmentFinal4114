//
//  ViewController.swift
//  AssignmentFinal4114
//
//  Created by Sandeep Jangra on 2020-01-24.
//  Copyright © 2020 Sandeep. All rights reserved.
//

import UIKit
import CoreData



class ViewController: UIViewController {

    var products : [Products]?
    
    @IBOutlet var textFields: [UITextField]!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCoreData()
        // Do any additional setup after loading the view.
    }

    
    
    func saveCoreData(){
   clearCoreData()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        let managedContext = appDelegate.persistentContainer.viewContext
        
        for  product in products!
        {
            let productEntity = NSEntityDescription.insertNewObject(forEntityName: "Product", into: managedContext)
            productEntity.setValue(product.Product_Name, forKey: "name")
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

    
    
    @IBAction func addProduct(_ sender: UIButton) {
        let id = Int(textFields[0].text ?? "0") ?? 0
         let name  = textFields[1].text ?? ""
         let desc =  textFields[2].text ?? ""
         let price = Int(textFields[3].text ?? "0") ?? 0
        
        let product =  Products(ProductName: name, Product_Description: desc, Product_Price: price, Product_Id: id)
        
        products?.append(product)
        
        for textField in textFields{
                  textField.text = ""
                  textField.resignFirstResponder()
              }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if let ProductTable = segue.destination as? ProductTableViewController{
               ProductTable.products = self.products
           }
       }
    
    

    func clearCoreData(){
         // create an instance of app delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                   // second step is context
                            
        let managedContext = appDelegate.persistentContainer.viewContext
                   
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        
        fetchRequest.returnsObjectsAsFaults = false
        do{
            let results = try managedContext.fetch(fetchRequest)
            for manageObjects in results{
                if let managedObjectData = manageObjects as? NSManagedObject
                {
                    managedContext.delete(managedObjectData)
                }
                
            }
        }catch{
            print(error)
        }
    }
}

