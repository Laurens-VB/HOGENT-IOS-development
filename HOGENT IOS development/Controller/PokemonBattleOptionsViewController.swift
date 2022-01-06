//
//  PokemonBattleOptionsViewController.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 06/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import UIKit

class PokemonBattleOptionsViewController: UIViewController
{

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let pokemonBattleOptionsView : PokemonBattleOptionsView  = PokemonBattleOptionsView( frame : CGRect (x : 0, y : (UIScreen.main.bounds.height/2),  width : (UIScreen.main.bounds.width) , height : (UIScreen.main.bounds.height/2) ) )
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(pokemonBattleOptionsView)
    }
}
