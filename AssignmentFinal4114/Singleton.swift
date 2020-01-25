//
//  Singleton.swift
//  AssignmentFinal4114
//
//  Created by Sandeep Jangra on 2020-01-24.
//  Copyright © 2020 Sandeep. All rights reserved.
//

import Foundation
import CoreData
class Singleton : NSObject
{
    
    private var productArray  = [Products]()
    private static var object = Singleton()

    private override init() {
        
    }
    
    internal static func getInstance() -> Singleton
    {
        return object
    }
    
    
   
    
    func addProduct(product: Products)
    {
        productArray.append(product)
    }
    
    func returnProductArray() -> [Products] {
        return productArray
    }
    
    func returnProductObj() -> Products?
    {
        for product in productArray
        {
            return product
        }
        return nil
        
    }
    func returnCount() -> Int
    {
        return productArray.count
    }
    
    
    func createProduct()
    {
       
       let p1 = Products(ProductName: "Samsung", Product_Description: "S10 pro", Product_Price: 1000, Product_Id: 1)
        let p2 = Products(ProductName: "Mac", Product_Description: "pro", Product_Price: 1000, Product_Id: 2)
       let p3 = Products(ProductName: "redmi", Product_Description: "max", Product_Price: 1000, Product_Id: 3)
        let p4 = Products(ProductName: "Tabs", Product_Description: "small pro", Product_Price: 1000, Product_Id: 4)
        let p5 = Products(ProductName: "abc", Product_Description: "abc", Product_Price: 1000, Product_Id: 5)
        let p6 = Products(ProductName: "sandwich", Product_Description: "grilled", Product_Price: 10, Product_Id: 6)
        let p7 = Products(ProductName: "burger", Product_Description: "large", Product_Price: 10, Product_Id: 7)
        let p8 = Products(ProductName: "fries", Product_Description: "small", Product_Price: 10, Product_Id: 8)
       let p9 = Products(ProductName: "fridge", Product_Description: "big", Product_Price: 1000, Product_Id: 9)
        let p10 = Products(ProductName: "tv", Product_Description: " pro", Product_Price: 1000, Product_Id: 10)
        
       addProduct(product: p1)
             
       addProduct(product: p2)
        addProduct(product: p3)
      addProduct(product: p4)
     addProduct(product: p5)
    addProduct(product: p6)
   addProduct(product: p7)
   addProduct(product: p8)
    addProduct(product: p9)
     addProduct(product: p10)
    }
    
    
    
    
}
