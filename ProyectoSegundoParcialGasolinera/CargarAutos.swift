//
//  CargarAutos.swift
//  ProyectoSegundoParcialGasolinera
//
//  Created by Alumno on 10/12/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation
import UIKit

class CargarAutos : UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var cargas : [Carga] = []
    
    var Autos : [Auto] = []
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return cargas.count
    }
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaCarga") as? CargasCeldaController
        let list = cargas[indexPath.row]
       
        celda?.set(Modelo : list)
        return celda!
        
    }
    @IBOutlet weak var txt_fabricacion: UITextField!
    @IBOutlet weak var txt_marca: UITextField!
    @IBOutlet weak var txt_placa: UITextField!
    @IBOutlet weak var txt_conductor: UITextField!
    @IBOutlet weak var txt_modelo: UITextField!
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete{
            self.cargas.remove(at: indexPath.row)
            self.Carro?.Carga.remove(at: indexPath.row)
            self.tv_CargasAutos.reloadData()
        }
    }
    
    @IBOutlet weak var tv_CargasAutos: UITableView!
    
    @IBAction func editar_auto(_ sender: Any)
    {
        if state == false {
            txt_placa.isEnabled = true
            txt_fabricacion.isEnabled = true
            txt_conductor.isEnabled = true
            txt_modelo.isEnabled = true
            txt_marca.isEnabled = true
            state = true
        }
        else{
            let NModo = Auto(placas: txt_placa.text!, conductor: txt_conductor.text! , marca: txt_marca.text!, modelo: txt_modelo.text!, fabricacion: txt_fabricacion.text!, Carga : cargas, Imagen: "imgCar1")
            callbackEditAuto!(NModo)
            state = false
            navigationController?.popViewController(animated: true)
        }
        
        
        
    }
    @IBOutlet weak var tct_modelo: UITextField!
    var Carro : Auto?
    var state : Bool?
    var callbackEditAuto : ((Auto) -> Void)?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.title = Carro?.placas
        state = false
        
        txt_placa.text = Carro?.placas
        txt_marca.text = Carro?.marca
        txt_modelo.text = Carro?.modelo
        txt_conductor.text = Carro?.conductor
        txt_fabricacion.text = Carro?.fabricacion
        
        tv_CargasAutos.dataSource = self
        tv_CargasAutos.delegate = self
       
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "GoToAgregarNuevaCarga"
        {
            let destino = segue.destination as? NuevaCargaController
            destino?.callbackAgregarCarga = agregar
            
            
        }
    }
    
    func  agregar(carga : Carga)
    {
        cargas.append(carga)
        Carro?.Carga.append(carga)
        tv_CargasAutos.reloadData()
    }
    
}
