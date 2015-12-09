//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Jaroslaw Nowosad on 08/12/2015.
//  Copyright © 2015 SkyCorp Ltd. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    @IBOutlet weak var mainImg: UIImageView!
    
    @IBOutlet weak var descLbl: UILabel!
    
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    
    @IBOutlet weak var pokedoxIdLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    
    @IBOutlet weak var nextEvolLbl: UILabel!
    
    
    @IBOutlet weak var prevImg: UIImageView!
    @IBOutlet weak var nextImg: UIImageView!
    
    var pokemon: Pokemon!

    @IBOutlet weak var nameLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name
    }
    
    
    @IBAction func backTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
