//
//  ViewController.swift
//  TestMeApp
//
//  Created by Mrudul Pendharkar on 29/05/16.
//  Copyright © 2016 ShreeVed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var changMeLabel: UILabel!
    
    @IBOutlet weak var iAmVisible: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onChangeBtnClicked(sender: AnyObject) {
        changMeLabel.text = "Changed Label"
    }

    
    @IBAction func onMakeVisibleBtnClicked(sender: AnyObject) {
        iAmVisible.hidden = false
    }
    
    @IBAction func onOpenAlertBtnClicked(sender: AnyObject) {
        let alertController = UIAlertController(title: "I am Alert", message:
            "Hello, world!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func onOpenModalBtnClicked(sender: AnyObject) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ModalViewControllerID") 
        self.navigationController?.presentViewController(controller, animated: true, completion: nil)
    }
}

