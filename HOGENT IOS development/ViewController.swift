//
//  ViewController.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 03/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    let pokemonGenerator : PokemonGenerator = PokemonGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        print("LMFAOOOOO")
        super.viewDidLayoutSubviews()
        
        var pokemons : [Pokemon] = [Pokemon]()
        
        do
        {
            print(":0")
            pokemons = try pokemonGenerator.genneratePokémons(amount: 6)
            print("xD")
            print(pokemons)
        }
        catch
        {
            print("pain")
            print(error)
        }
        
        let pokemon = pokemons[0]
        
        let pokémonView = PokemonView(frame : CGRect (x : 0, y : 0, width : 100, height : 100) )
        
        pokémonView.pokemonName(name: pokemon.name)
        
        pokémonView.center = view.center
        
        view.addSubview(pokémonView)
    }
    
    


}
