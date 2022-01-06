//
//  ViewController.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 03/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import UIKit
class PokemonBattleSceneViewController: UIViewController
{
    let pokemonGenerator : PokemonGenerator = PokemonGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        
        var pokemons : [Pokemon] = [Pokemon]()
        
        do
        {
            pokemons = try pokemonGenerator.genneratePokémons(amount: 2)
            print(pokemons)
        }
        catch
        {
            print(error)
        }
        
        //let pokemon = pokemons[0]
        let screenSize: CGRect = UIScreen.main.bounds
        
        let pokémonView = PokemonBattleSceneView(frame : CGRect (x : 0, y : 0,  width : (screenSize.width) , height : (screenSize.height/2) ) )
        
        //pokémonView.generateButtons(pokemons: pokemons)
        
        //pokémonView.center = view.center
        
        /*pokémonView.setImage(from: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/483.png")*/
        
        pokémonView.setImagePokemons(pokemons: pokemons)
        
        view.addSubview(pokémonView)
    }
    
    


}
