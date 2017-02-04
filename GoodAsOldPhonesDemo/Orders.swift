//
//  Orders.swift
//  GoodAsOldPhonesDemo
//
//  Created by totoros on 30/01/17.
//  Copyright © 2017 Code School. All rights reserved.
//

import Foundation

class Orders {
    
    var orders: [Order]?
    
    ///This function returns the path to the file where the cart's data are saved
    /// :returns: the path string
    class func archiveFilePath() -> String {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return documentsDirectory.appendingPathComponent("cart.archive").path
    }
    
    ///This function returns the cart's data saved at the selected store place
    /// - returns: The cart's data saved in an array of objects Order
    class func readOrdersFromArchive() -> [Order]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: archiveFilePath()) as? [Order]
    }
    
    ///This function save an array of objects Order at the selected store place
    /// - parameter orders: The array of objects to save
    class func saveOrdersToArchive(orders: [Order]) -> Void {
        _ = NSKeyedArchiver.archiveRootObject(orders, toFile: archiveFilePath())
    }
}
