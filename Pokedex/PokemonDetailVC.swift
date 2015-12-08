//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Jaroslaw Nowosad on 08/12/2015.
//  Copyright © 2015 SkyCorp Ltd. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!

    @IBOutlet weak var nameLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name
    }
    
    
}
