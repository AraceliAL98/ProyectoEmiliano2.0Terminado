//
//  CargasCeldaController.swift
//  ProyectoSegundoParcialGasolinera
//
//  Created by Alumno on 10/12/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import UIKit

class CargasCeldaController: UITableViewCell
{

  
    override func awakeFromNib()
    {
        super.awakeFromNib()
       
    }
    
    @IBOutlet weak var lbl_costo: UILabel!
    @IBOutlet weak var lbl_litros: UILabel!
    func set(Modelo: Carga)
    {
        lbl_costo.text = Modelo.cantidad
        lbl_litros.text = Modelo.litros
      
        
    }
    
}
