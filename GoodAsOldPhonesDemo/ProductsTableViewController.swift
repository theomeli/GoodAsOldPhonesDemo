//
//  ProductsTableViewController.swift
//  GoodAsOldPhonesDemo
//
//  Created by totoros on 26/01/17.
//  Copyright © 2017 Code School. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {

    var products: [Product]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let product1 = Product(text: "1907 Wall Set", productImage: "phone-fullscreen1", cellImage: "image-cell1", price: 10.5)
        let product2 = Product(text: "1921 Dial Phone", productImage: "phone-fullscreen2", cellImage: "image-cell2", price: 13.99)
        let product3 = Product(text: "1937 Desk Set", productImage: "phone-fullscreen3", cellImage: "image-cell3", price: 9.45)
        let product4 = Product(text: "1984 Motorola Portable", productImage: "phone-fullscreen4", cellImage: "image-cell4", price: 53.60)
        
        products = [product1, product2, product3, product4]
     
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueToProduct") {
            guard let d = segue.destination as? ProductViewController, let indexPath = self.tableView.indexPathForSelectedRow, let products = products else {
                return
            }
            //it prepares the ProductViewController's product 
            d.product = products[indexPath.row]
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let products = products {
            return products.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        if let products = products {
            if let i = products[indexPath.row].cellImage {
                cell.imageView?.image = UIImage(named: i)
            }
            
            cell.textLabel?.text = products[indexPath.row].text
        }
        
        return cell
    }

}
