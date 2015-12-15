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
    
    @IBOutlet weak var bigImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name.capitalizedString
        mainImg.image = UIImage(named: "\(pokemon.id)")
        pokedoxIdLbl.text = "\(pokemon.id)"
        self.bigImg.image = UIImage(named: "\(self.pokemon.id)")
        self.nextImg.image = UIImage(named: "\(self.pokemon.id)")
        self.prevImg.image = UIImage(named: "\(self.pokemon.id)")
        
        pokemon.downloadPokemonDetails { () -> () in
            // this will be called after download is done
            self.updateUI()
        }
        
        pokemon.getBigImg { () -> () in
            // this will be called after download is done
            self.updateBigImg()
        }
        
        

        

    }
    
    
    func updateUI() {
        self.descLbl.text = self.pokemon.desc
        self.typeLbl.text = self.pokemon.type
        self.heightLbl.text = self.pokemon.height
        self.weightLbl.text = self.pokemon.weight
        self.defenseLbl.text = self.pokemon.defense
        self.attackLbl.text = self.pokemon.attack
        if  self.pokemon.nextEvol != ""  {
            self.nextEvolLbl.text = "Next evolution: \(self.pokemon.nextEvol) LVL \(self.pokemon.nextEvolLvl)"
            self.nextImg.hidden = false
            self.nextImg.image = UIImage(named: "\(self.pokemon.nextEvolID)")
        } else {
            self.nextEvolLbl.text = "No evolutions"
            self.nextImg.hidden = true
            
        }
        
        self.prevImg.image = UIImage(named: "\(self.pokemon.id)")
        
        
    }
    
    func updateBigImg() {
        if let img = self.pokemon.bigImg {
            self.bigImg.image = UIImage(data: img)
            self.bigImg.contentMode = UIViewContentMode.ScaleAspectFit
        }
    }
    
    
    @IBAction func backTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
