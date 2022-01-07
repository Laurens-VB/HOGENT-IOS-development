//
//  PokemonBattleViewController.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 06/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import UIKit

class PokemonBattleViewController: UIViewController
{
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let pokemonBattleView : PokemonBattleView = PokemonBattleView (
        frame: CGRect(
            x : 0
            , y : 0
            , width : UIScreen.main.bounds.width
            , height : UIScreen.main.bounds.height
        )
    )
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.addSubview(pokemonBattleView)
    }
}
