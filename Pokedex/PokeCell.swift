//
//  PokeCell.swift
//  Pokedex
//
//  Created by Jaroslaw Nowosad on 04/12/2015.
//  Copyright © 2015 SkyCorp Ltd. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg : UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!
    
    func configureCell(pokemon: Pokemon) {
        self.pokemon = pokemon
        
        nameLbl.text = self.pokemon.name.capitalizedString
        thumbImg.image = UIImage(named: "\(self.pokemon.id)")
    }
    
}
