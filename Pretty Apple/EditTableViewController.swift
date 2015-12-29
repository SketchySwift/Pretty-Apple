//
//  EditTableViewController.swift
//  Pretty Apple
//
//  Created by HardcoreIOS on 12/28/15.
//  Copyright © 2015 HardcoreIOS. All rights reserved.
//

import UIKit

class EditTableViewController: UITableViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

	// 1. Create the model
	var product: Product?
	
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		self.view.endEditing(true)
		return true
	}
	
	override func scrollViewWillBeginDragging(scrollView: UIScrollView) {
		productDescriptionTextView.resignFirstResponder()
	}

	@IBOutlet weak var productImageView: UIImageView!
	@IBOutlet weak var productTitleTextField: UITextField!
	@IBOutlet weak var productDescriptionTextView: UITextView!

	// 2. Create the ViewController's life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Edit Product"
		
		productImageView.image = product?.image
		productTitleTextField.text = product?.title
		productDescriptionTextView.text = product?.description
	}
	
	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		
		product?.title = productTitleTextField.text!
		product?.description = productDescriptionTextView.text
		product?.image = productImageView.image!
	}
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		if indexPath.section == 0 && indexPath.row == 0 {
			let picker = UIImagePickerController()
			picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
			picker.allowsEditing = false
			
			picker.delegate = self
			presentViewController(picker, animated: true, completion: nil)
			
		}
	}
	
	func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
		let image = info[UIImagePickerControllerOriginalImage] as! UIImage
		product?.image = image
		productImageView.image = image
		self.dismissViewControllerAnimated(true, completion: nil)
	}
	
}


