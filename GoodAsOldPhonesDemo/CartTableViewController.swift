//
//  CartTableViewController.swift
//  GoodAsOldPhonesDemo
//
//  Created by totoros on 30/01/17.
//  Copyright © 2017 Code School. All rights reserved.
//

import UIKit

class CartTableViewController: UITableViewController {

    var orders: [Order]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        orders = Orders.readOrdersFromArchive()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let orders = orders {
            return orders.count + 1
        }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath)
        
        //if cell is a product cell appears the product's name and its price else appears the total amount
        if let orders = orders {
            if (indexPath.row != (self.orders?.count)!) {
                let priceString: String = (orders[indexPath.row].product?.text)! + " " + Product.formatPrice(price: (orders[indexPath.row].product?.price)!) + "$"
                cell.textLabel?.text = priceString
            }
            else {
                cell.textLabel?.text = "Total: " + Product.formatPrice(price: CartTableViewController.sumOrders(orders: orders)) + "$"
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //delete the cell only if it contains a product else do nothing
            if (indexPath.row != (self.orders?.count)!) {
                orders?.remove(at: indexPath.row)
            
                if let orders = orders {
                    Orders.saveOrdersToArchive(orders: orders)
                }
            
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.reloadData()
            }
            else {}
        } else if editingStyle == .insert {}
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueCartToProduct") {
            let d = segue.destination as! ProductViewController
            let indexPath = tableView.indexPathForSelectedRow
            d.product = orders?[(indexPath?.row)!].product
        }
    }
    
    ///This function calculates the total price amount of the products added in cart
    /// - parameter orders: The array with the orders to be added
    /// - returns: A double with the total amount
    class func sumOrders(orders: [Order]) -> Double {
        var sum: Double = 0
        for o in orders {
            sum += (o.product?.price)!
        }
        
        return sum
    }

}
