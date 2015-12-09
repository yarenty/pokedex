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
    private var _desc: String!
    private var _type:String!
    private var _defense: String!
    private var _weight: String!
    private var _height: String!
    private var _attack: String!
    private var _nextEvol: String!
    
    
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
