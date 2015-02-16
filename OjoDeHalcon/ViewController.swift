//
//  ViewController.swift
//  OjoDeHalcon
//
//  Created by Fran Thinway on 14/2/15.
//  Copyright (c) 2015 Thinway. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    var valorActual = 0
    var valorGenerado = 0
    var puntuacion = 0
    var ronda = 0
    
    @IBOutlet weak var valorLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var puntuacionLabel: UILabel!
    @IBOutlet weak var rondaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, forState: .Normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        if let trackLeftImage = UIImage(named: "SliderTrackLeft") {
            let trackLeftResizable = trackLeftImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
        }
        
        if let trackRightImage = UIImage(named: "SliderTrackRight") {
            let trackRightResizable = trackRightImage.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(trackRightResizable, forState: .Normal)
        }
        
        iniciarNuevoJuego()
        actualizarLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let diferencia = abs(valorGenerado - valorActual)
        var puntos = 100 - diferencia
        
        var titulo: String
        if diferencia == 0 {
            titulo = "Impresionante!"
            puntos += 100
        } else if diferencia < 5 {
            titulo = "Muy cerca!"
            if diferencia == 1 {
                puntos += 75
            }else{
                puntos += 50
            }
        } else if diferencia < 10 {
            titulo = "Se puede mejorar"
        } else if diferencia < 30 {
            titulo = "Sabes cómo se juega?"
        } else {
            titulo = "Búscate un oculista"
        }
        
        puntuacion += puntos
        
        let message = "Has conseguido \(puntos) puntos."
                      + "\nEl valor que has puesto es: \(valorActual)"
        
//            + "\nEl valor generado es: \(valorGenerado)"
//            + "\nLa diferencia es \(diferencia)"
        
        let alert = UIAlertController(title: titulo, message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default,
                            handler: { action in
                                self.iniciarNuevaRonda()
                                self.actualizarLabels()
                        })
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
//        iniciarNuevaRonda()
//        actualizarLabels()
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        valorActual = lroundf(slider.value)
    }
    
    @IBAction func reiniciarJuego() {
        iniciarNuevoJuego()
        actualizarLabels()
        
        let transition = CATransition()
        transition.type = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        view.layer.addAnimation(transition, forKey: nil)
    }
    
    func iniciarNuevaRonda() {
        ronda += 1
        valorGenerado = 1 + Int(arc4random_uniform(100))
        valorActual = 50
        slider.value = Float(valorActual)
    }
    
    func actualizarLabels() {
        valorLabel.text = String(valorGenerado)
        puntuacionLabel.text = String(puntuacion);
        rondaLabel.text = String(ronda)
    }
    
    func iniciarNuevoJuego() {
        puntuacion = 0
        ronda = 0
        iniciarNuevaRonda()
    }
}

