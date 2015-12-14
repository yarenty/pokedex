//
//  Pokemon.swift
//  Pokedex
//
//  Created by Jaroslaw Nowosad on 04/12/2015.
//  Copyright © 2015 SkyCorp Ltd. All rights reserved.
//

import Foundation
import Alamofire

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
    private var _nextEvolID: String!
    private var _nextEvolLvl: String!
    private var _pokemonURL: String!
    
    
    var name: String {
        return _name
    }
    var id: Int {
        return _id
    }
    var desc: String {
        if _desc == nil {
            _desc = ""
        }
        return _desc
    }
    var type:String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    var weight: String{
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    var height: String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    var attack: String {
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }
    var nextEvol: String {
        get {
            if _nextEvol == nil {
                _nextEvol = ""
            }
            return _nextEvol
        }
    }
    var nextEvolID: String {
        if _nextEvolID == nil {
            _nextEvolID = ""
        }
        return _nextEvolID
    }
    var nextEvolLvl: String {
        if _nextEvolLvl == nil {
            _nextEvolLvl = ""
        }
        return _nextEvolLvl
    }
    var pokemonURL: String {
        if _pokemonURL == nil {
            _pokemonURL = ""
        }
        return _pokemonURL
    }
    
    
    init( name: String, id: Int){
        _name = name
        _id = id
        
        _pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(_id)/"
    }
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        
        let url = NSURL(string: _pokemonURL)!
        Alamofire.request(.GET, url).responseJSON {
            response in let result = response.result
            
            print(result.debugDescription)
            
            if let dict = result.value as? Dictionary<String,AnyObject> {
                
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                print(self._defense)
                print(self._attack)
                print(self._height)
                print(self._weight)
                
                if let types = dict["types"] as? [Dictionary<String,String>]  where types.count > 0 {
                    print(types.debugDescription)
                    
                    if let name = types[0]["name"] { // first one
                        self._type = name.capitalizedString
                    }
                    
                    if types.count > 1 {
                        for var x = 1; x < types.count; x++ {
                            if let name = types[x]["name"] {
                                self._type! += "/\(name.capitalizedString)"
                            }
                        }
                    }
                } else {
                    self._type = ""
                }
                
                print(self._type)
                
                if let descArr = dict["descriptions"] as? [Dictionary<String,String>] where descArr.count > 0 {
                    if let urlDesc = descArr[0]["resource_uri"] {
                        
                        let uri = NSURL(string: "\(URL_BASE)\(urlDesc)")!
                        
                        
                        //request is asynchronous
                        Alamofire.request(.GET, uri).responseJSON { response in
                            let dResult = response.result
                            if let desDict = dResult.value as? Dictionary<String,AnyObject> {
                                
                                if let dd = desDict["description"] as? String {
                                    self._desc = dd
                                    print(dd)
                                }
                            }
                            
                            completed()
                        }
                    }
                } else {
                    self._desc = ""
                }
                
                if let evolD = dict["evolutions"] as? [Dictionary<String,AnyObject>] where evolD.count > 0 {
                    if let to = evolD[0]["to"] as? String {
                        
                        //TODO: check mega data
                        //mega is not found
                        if to.rangeOfString("mega") == nil {
                            if let uri = evolD[0]["resource_uri"] as? String {
                                
                                self._nextEvolID = uri.stringByReplacingOccurrencesOfString("/api/v1/pokemon/", withString: "").stringByReplacingOccurrencesOfString("/", withString: "")
                                self._nextEvol = to
                                
                                if let lvl = evolD[0]["level"] as? Int {
                                    self._nextEvolLvl = "\(lvl)"
                                }
                                
                                print(self._nextEvol)
                                print(self._nextEvolID)
                                print(self._nextEvolLvl)
                            }
                        }
                    }
                    
                    
                }
                
                
            }
        }
    }
    
}
