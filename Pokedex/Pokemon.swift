//
//  Pokemon.swift
//  Pokedex
//
//  Created by Jaroslaw Nowosad on 04/12/2015.
//  Copyright © 2015 SkyCorp Ltd. All rights reserved.
//

import Foundation

class Pokemon {
    private var _name: String!
    private var _id: Int!
    
    
    var name: String {
        return _name
    }
    
    var id: Int {
        return _id
    }
    
    init( name: String, id: Int){
        _name = name
        _id = id
    }
    
}
