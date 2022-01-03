//
//  ViewController.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 03/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let pokémonView = PokemonView(frame : CGRect (x : 0, y : 0, width : 100, height : 100) )
        
        pokémonView.pokemonName(name: "bulbasaur")
        
        pokémonView.center = view.center
        
        view.addSubview(pokémonView)
        
    }
    
    


}
