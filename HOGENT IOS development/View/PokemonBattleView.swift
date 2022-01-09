//
//  PokemonBattleView.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 06/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import UIKit

class PokemonBattleView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var pokemonBattleOptions : PokemonBattleOptionsView
    
    let pokemonBattleScene : PokemonBattleSceneView =
    {
        let pokemonBattleScene : PokemonBattleSceneView = PokemonBattleSceneView()
        return pokemonBattleScene
        
    }()
    
    init(frame : CGRect, moveNames : [String])
    {
        print(moveNames)
        pokemonBattleOptions = {
            let pokemonBattleOptions : PokemonBattleOptionsView = PokemonBattleOptionsView(frame : frame, moveNames: moveNames)
            return pokemonBattleOptions
        }()
        super.init(frame : frame)
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews()
    {
        pokemonBattleScene.frame = CGRect (
            x : 0
            , y : 0
            , width : (frame.size.width)
            , height : (frame.size.height/2)
        )
        
        pokemonBattleOptions.frame = CGRect (
            x : 0
            , y : (frame.size.height/2)
            , width : (frame.size.width)
            , height : (frame.size.height/2)
        )
        
        addSubview(pokemonBattleScene)
        addSubview(pokemonBattleOptions)
    }
}
