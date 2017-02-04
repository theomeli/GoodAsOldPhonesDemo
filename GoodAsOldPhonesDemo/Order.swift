//
//  Order.swift
//  GoodAsOldPhonesDemo
//
//  Created by totoros on 30/01/17.
//  Copyright © 2017 Code School. All rights reserved.
//

import Foundation

class Order: NSObject, NSCoding {
    var order_id: Int?
    var product: Product?
    
    init(order_id: Int, product: Product) {
        self.order_id = order_id
        self.product = product
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.order_id = aDecoder.decodeObject(forKey: "order_id") as! Int?
        self.product = aDecoder.decodeObject(forKey: "product") as! Product?
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.order_id, forKey: "order_id")
        aCoder.encode(self.product, forKey: "product")
    }
}
