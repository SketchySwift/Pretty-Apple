//
//  DetailViewController.swift
//  Pretty Apple
//
//  Created by Abdurrahman on 12/7/15.
//  Copyright © 2015 Hafiz Developer. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

	@IBOutlet weak var productImageView: UIImageView!
	
	var product: Product?
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		productImageView.image = product?.image
    }
	

	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
		
	//}




}
