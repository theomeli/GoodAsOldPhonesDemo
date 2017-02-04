//
//  Product.swift
//  GoodAsOldPhonesDemo
//
//  Created by totoros on 26/01/17.
//  Copyright © 2017 Code School. All rights reserved.
//

import Foundation

class Product: NSObject, NSCoding {
    var text: String?
    var productImage: String?
    var cellImage: String?
    var price: Double?
    
    init(text: String, productImage: String, cellImage: String, price: Double) {
        self.text = text
        self.productImage = productImage
        self.cellImage = cellImage
        self.price = price
    }
    
    required init?(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObject(forKey: "text") as? String
        productImage = aDecoder.decodeObject(forKey: "productImage") as? String
        cellImage = aDecoder.decodeObject(forKey: "cellImage") as? String
        price = aDecoder.decodeObject(forKey: "price") as? Double
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: "text")
        aCoder.encode(productImage, forKey: "productImage")
        aCoder.encode(cellImage, forKey: "cellImage")
        aCoder.encode(price, forKey: "price")
    }
    
    ///This function returns a formatted double value to two decimal places
    /// - parameter price: The double to be formatted
    /// - returns: The formatted double in a string form
    class func formatPrice(price: Double) -> String {
        return String(format: "%.2f", price)
    }
}
