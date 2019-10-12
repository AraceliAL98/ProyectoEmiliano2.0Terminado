//
//  ViewController.swift
//  ProyectoSegundoParcialGasolinera
//
//  Created by Alumno on 10/8/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var Fila : Int?
    
    var Autos : [Auto] = []
    
    @IBOutlet weak var tv_Autos: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tv_Autos.dataSource = self
        tv_Autos.delegate = self
        
       Autos = createArray()
    }
    
    func createArray() -> [Auto]
    {
       var tempList : [Auto] = []
        let L1 = Auto(placas: "ARJ4-5522", conductor: "Alice", marca: "KIA", modelo: "Soul", fabricacion: "2020", Imagen: "imgCar1")
        let L2 = Auto(placas: "JR45-5520", conductor: "Marco", marca: "GMC", modelo: "Sierra", fabricacion: "2018", Imagen:"imgCar2")
        let L3 = Auto(placas: "VMR5-J123", conductor: "Francisco", marca: "Chevrolet", modelo: "Cruze", fabricacion: "2020", Imagen: "imgCar3")
        let L4 = Auto(placas: "HRT7-MX12", conductor: "Alma", marca: "Audi", modelo: "A4", fabricacion: "2020", Imagen: "")
        
        tempList.append(L1)
        tempList.append(L2)
        tempList.append(L3)
        tempList.append(L4)
        
        return tempList
    }

}
extension ViewController : UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return Autos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaAutos") as! CeldaAutosController
        
        let list = Autos[indexPath.row]
        
        celda.set(Modelo : list)
        
        return celda
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "GoToNuevoAuto"
        {
            let destino = segue.destination as? NuevoCarroCotroller
            destino?.callbackAgregarNuevo = agregar
        }
        
        if segue.identifier == "GoToCargasAuto"
        {
            let destino = segue.destination as? CargarAutos
            destino?.Carro = Autos[tv_Autos.indexPathForSelectedRow!.row]
            let indexPath = tv_Autos.indexPath(for: (sender as? UITableViewCell)!)
            //destino?.createCargas(fila: Fila)
            let listDestination = Autos[indexPath!.row]
            //Fila = indexPath?.row
            destino?.cargas = Autos[indexPath!.row].Carga as! [Carga]
            
            destino?.Carro = listDestination
            destino?.callbackEditAuto = editarTabla
        }
    }
    func editarTabla(auto: Auto)
    {
        Autos[Fila!] = auto
        tv_Autos.reloadData()
    }
    func agregar(auto : Auto)
    {
        Autos.append(auto)
        tv_Autos.reloadData()
    }
    
    
}

