//
//  AppleProductsTableViewController.swift
//  Pretty Apple
//
//  Created by Abdurrahman on 12/6/15.
//  Copyright © 2015 Hafiz Developer. All rights reserved.
//

import UIKit

class AppleProductsTableViewController: UITableViewController {

	lazy var productLines: [ProductLine] = {
		return ProductLine.productLines()
	}()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
		self.navigationItem.leftBarButtonItem?.tintColor = UIColor.whiteColor()
		
		// MARK: - Fix the size
		// tableView.estimatedRowHeight = tableView.rowHeight
		// tableView.rowHeight = UITableViewAutomaticDimension
		
    }
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		tableView.reloadData()
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

	override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		let productLine = productLines[section]
		return productLine.name
	}

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return productLines.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
		let productLine = productLines[section]
		
        return productLine.products.count
    }

	
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ProductTableViewCell
		
		let productLine = productLines[indexPath.section]
		let product = productLine.products[indexPath.row]
		
		cell.configureCell(product)
        // Configure the cell...

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

	
	// Override to support editing the table view.
	override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		if editingStyle == .Delete {
			// Delete the row from the data source
			let productLine = productLines[indexPath.section]
			productLine.products.removeAtIndex(indexPath.row)
			
			tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
			//tableView.reloadData()
		}
		
	}

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

	
    // MARK: - Navigation
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		
		if let identifier = segue.identifier {
			
			switch identifier {
				case "Detail":
					let detailVC = segue.destinationViewController as? DetailViewController
					
					if let indexPath = self.tableView.indexPathForCell(sender as! UITableViewCell) {
						detailVC?.product = productAtIndexPath(indexPath)
					}
				case "showEdit":
					let editTableVC = segue.destinationViewController as? EditTableViewController
				
					if let indexPath = self.tableView.indexPathForCell(sender as! UITableViewCell) {
						editTableVC?.product = productAtIndexPath(indexPath)
					}
				
				default: break
			}
		}
		
    }// END: - prepareForSegue() function
	
	
	// MARK: -------->>> Helper Method
	func productAtIndexPath(indexPath: NSIndexPath) -> Product {
		
		let productLine = productLines[indexPath.section]
		
		return productLine.products[indexPath.row]
	}
	
	override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
		let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView //recast your view as a UITableViewHeaderFooterView
		header.contentView.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: CGFloat(drand48()))//make the background color light blue
		header.textLabel?.textColor = UIColor.whiteColor() //make the text white
		//header.alpha = 0.5 //make the header transparent
	}
	
	public func showAlert(title: String, message: String, closeButton: String) {
		let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
		alertController.addAction(UIAlertAction(title: closeButton, style: .Default, handler: nil))
		self.presentViewController(alertController, animated: true, completion: nil)
	}
	
//	override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//	
//		let footerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 40))
//	
//		footerView.backgroundColor = UIColor.whiteColor()
//		
//		return footerView
//
//	}
	

}
