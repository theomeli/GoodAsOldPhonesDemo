//
//  ProductViewController.swift
//  GoodAsOldPhonesDemo
//
//  Created by totoros on 26/01/17.
//  Copyright © 2017 Code School. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var productTextView: UILabel!
    
    @IBOutlet weak var productImageView: UIImageView!
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let t = product?.text {
            productTextView.text = t
        }
        if let i = product?.productImage {
            productImageView.image = UIImage(named: i)
        }
    }
    
    @IBAction func addToCart(_ sender: Any) {
        //adding an alert view on clicking the addToCart button
        if let price = product?.price {
            let alert = UIAlertController(title: "Saved to Cart", message: "Saved to cart with a value of \(Product.formatPrice(price: price))$", preferredStyle: .alert)
            present(alert, animated: true)
            
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(OKAction)
        } else {return}
        
        //manipulate the encoding and decoding of the products added in cart
        if let product = product {
            let order = Order(order_id: 1, product: product)
        
            if var orders = Orders.readOrdersFromArchive() {
                orders.append(order)
                Orders.saveOrdersToArchive(orders: orders)
            }
        }
    }
}
