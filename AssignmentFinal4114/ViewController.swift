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
    var index1: Int = 1
    var name = " "
    var id = 0
    var desc = " "
    var price = 0.0
   
    
    @IBOutlet var textFields: [UITextField]!
    override func viewDidLoad() {
        super.viewDidLoad()
      //  loadCoreData()
        // Do any additional setup after loading the view.
        textFields[0].text="\(id)"
        textFields[1].text=name
        textFields[2].text=desc
        textFields[3].text="\(price)"
        
        
        
    }
    func setIndex(index: Int,data: Int){
               print(data);
               id = data
        print(id)
               products = [Products]()
               
               let appDelegate = UIApplication.shared.delegate as! AppDelegate
               let managedContext = appDelegate.persistentContainer.viewContext
               
               let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
               
               do {
                   let results = try managedContext.fetch(fetchRequest)
                   if results is [NSManagedObject]{
                       for result in (results as! [NSManagedObject]) {
                           let pname = result.value(forKey: "name") as! String
                           let pid = result.value(forKey: "id") as! Int16
                           let pdesc = result.value(forKey: "desc") as! String
                           
                           let pprice = result.value(forKey: "price") as! Float
                           
                           if (id == data)
                           {
                               print(name)
                            products?.append(Products(ProductName: name, Product_Description: desc, Product_Price: Int(price), Product_Id: id))
                           
                               name = pname
                            id = Int(pid)
                               desc = pdesc
                            price = Double(pprice)
                               
                           }
                           
                           
                       }
                   }
               } catch  {
                   print(error)
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
         
    /*
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
    }*/
}

