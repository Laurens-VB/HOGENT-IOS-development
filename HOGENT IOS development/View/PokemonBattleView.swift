//
//  PokemonView.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 03/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import UIKit

class PokemonBattleView: UIView
{
    //MOET ERGENS EEN VEEL BETERE PLAATS KRIJGEN IS SCHANDALIG DAT DIT HIER STAAT
    var counter = 0
    

    private var imageViewEnemy : UIImageView =
    {
        let imageViewEnemy = UIImageView()
        return imageViewEnemy
    }()
    
    private var imageViewAly : UIImageView =
    {
        let imageViewAly = UIImageView()
        return imageViewAly
    }()
    
    override init(frame : CGRect)
    {
        super.init(frame : frame)
        backgroundColor = .cyan
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews()
    {
        imageViewEnemy.frame = CGRect(
            x : frame.size.width - 100
            , y : 0
            , width: 100
            , height: 100
        )
        
        imageViewAly.frame = CGRect(
            x : 0
            , y : frame.size.height - 100
            , width : 100
            , height : 100
        )
        
        addSubview(imageViewEnemy)
        addSubview(imageViewAly)
    }
    
    func setImagePokemons(pokemons : [Pokemon])
    {
        let pokemonSpriteHelper :PokemonSpriteHelper = PokemonSpriteHelper()
        
        do
        {
            try imageViewAly = pokemonSpriteHelper.setImage(from : pokemons[0].sprites!.back_default!)!
            
            try imageViewEnemy = pokemonSpriteHelper.setImage(from : pokemons[1].sprites!.front_default!)!
        }
        catch is Error { }
    }
}
