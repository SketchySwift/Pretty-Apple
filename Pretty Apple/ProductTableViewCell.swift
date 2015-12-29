//
//  ProductTableViewCell.swift
//  Pretty Apple
//
//  Created by Abdurrahman on 12/7/15.
//  Copyright © 2015 Hafiz Developer. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

	@IBOutlet weak var productImageView: UIImageView!

	@IBOutlet weak var productTitle: UILabel!
	@IBOutlet weak var productDescription: UILabel!

	func configureCell(product: Product) {
		
		productImageView.image = product.image
		
		productTitle.text = product.title
		productDescription.text = product.description
		
	}
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
    }
	
	/*
	override func setSelected(selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	*/

}
