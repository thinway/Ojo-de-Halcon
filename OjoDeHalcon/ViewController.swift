//
//  ViewController.swift
//  OjoDeHalcon
//
//  Created by Fran Thinway on 14/2/15.
//  Copyright (c) 2015 Thinway. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Hola K Ase", message: "Mi primer botón funcionando", preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "Alucina!!!", style: .Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
}

