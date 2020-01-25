//
//  Products.swift
//  AssignmentFinal4114
//
//  Created by Sandeep Jangra on 2020-01-24.
//  Copyright © 2020 Sandeep. All rights reserved.
//

import Foundation


class Products {
    internal init(ProductName: String, Product_Description: String, Product_Price: Int, Product_Id: Int) {
        self.Product_Name = ProductName
        self.Product_Description = Product_Description
        self.Product_Price = Product_Price
        self.Product_Id = Product_Id
    }
    
      var Product_Name : String
      var Product_Description: String
      var Product_Price : Int
      var Product_Id : Int
}
