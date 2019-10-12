//
//  NuevoAutoController.swift
//  ProyectoSegundoParcialGasolinera
//
//  Created by Alumno on 10/9/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation
import UIKit

class NuevoCarroCotroller : UIViewController
{
    var callbackAgregarNuevo : ((Auto)-> Void)!
    
    
    
    @IBOutlet weak var txt_fabricacion: UITextField!
    @IBOutlet weak var txt_modelo: UITextField!
    @IBOutlet weak var txt_marca: UITextField!
    @IBOutlet weak var txt_conductor: UITextField!
    @IBOutlet weak var txt_placa: UITextField!
    
    @IBAction func doTapGuardar(_ sender: Any)
    {
        var auto : Auto
        
        auto = Auto(placas:"", conductor:"", marca:"", modelo:"", fabricacion:"", Imagen:"")
        
        auto.conductor = txt_conductor!.text
        auto.fabricacion = txt_fabricacion!.text
        auto.marca = txt_marca!.text
        
        auto.modelo = txt_modelo!.text
        
        callbackAgregarNuevo(auto)
        navigationController?.popViewController(animated: true)
        
    }
    override func viewDidLoad()
    {
        
    }
    
}
