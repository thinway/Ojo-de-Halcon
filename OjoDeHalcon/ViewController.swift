//
//  ViewController.swift
//  OjoDeHalcon
//
//  Created by Fran Thinway on 14/2/15.
//  Copyright (c) 2015 Thinway. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var valorActual: Int = 0
    var valorGenerado: Int = 0
    
    @IBOutlet weak var valorLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iniciarNuevaRonda()
        actualizarLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let message = "El valor del slide es: \(valorActual)"
            + "\nEl valor generado es: \(valorGenerado)"
        
        let alert = UIAlertController(title: "Hola K Ase", message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
        iniciarNuevaRonda()
        actualizarLabels()
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        valorActual = lroundf(slider.value)
    }
    
    func iniciarNuevaRonda() {
        valorGenerado = 1 + Int(arc4random_uniform(100))
        //valorActual = 50
        slider.value = Float(valorActual)
    }
    
    func actualizarLabels() {
        valorLabel.text = String(valorGenerado)
    }
}

