//
//  ModalViewController.swift
//  TestMeApp
//
//  Created by Mrudul Pendharkar on 30/05/16.
//  Copyright © 2016 ShreeVed. All rights reserved.
//


import UIKit

class ModalViewController: UIViewController {
    
    @IBAction func onBackBtnClicked(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}