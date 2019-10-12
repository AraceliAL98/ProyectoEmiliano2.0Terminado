//
//  Autos.swift
//  ProyectoSegundoParcialGasolinera
//
//  Created by Alumno on 10/9/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation

class Auto
{
    var placas : String
    var conductor : String?
    var marca : String?
    var modelo : String?
    var fabricacion : String?
    var Carga : [Carga?] = []
    var Imagen : String?
    
    init (placas : String, conductor : String?, marca : String?, modelo : String?, fabricacion : String?, Carga: [Carga?] = [], Imagen : String)
    {
        self.placas = placas
        self.Imagen = Imagen
        
        if let M_conductor = conductor
        {
            self.conductor = M_conductor
        }
        if let M_marca = marca
        {
            self.marca = M_marca
        }
        if let M_modelo = modelo
        {
            self.modelo = M_modelo
        }
        if let M_Cargas : [Carga] = Carga as? [Carga]{
            self.Carga = M_Cargas
        }
        if let M_fabricacion = fabricacion
        {
            self.fabricacion = M_fabricacion
        }
     
        
        
            
        
    }
 }
