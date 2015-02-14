//
//  ViewController.swift
//  OjoDeHalcon
//
//  Created by Fran Thinway on 14/2/15.
//  Copyright (c) 2015 Thinway. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var valorActual: Int = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let message = "El valor del slide es: \(valorActual)"
        
        let alert = UIAlertController(title: "Hola K Ase", message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        valorActual = lroundf(slider.value)
    }
}

