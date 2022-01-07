//
//  PokemonView.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 03/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import UIKit

class PokemonBattleSceneView: UIView
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
    
    private var imageViewAlyDisc : UIImageView =
    {
        let imageViewAlyDisc = UIImageView( image : UIImage(named : "AlyBattleDisc") )
        return imageViewAlyDisc
    }()
    
    private var imageViewEnemyDisc : UIImageView =
    {
        let imageViewEnemyDisc = UIImageView( image : UIImage(named : "EnemyBattleDisc") )
        return imageViewEnemyDisc
    }()
    
    private var imageViewBattleBackDrop : UIImageView =
    {
        let imageViewEnemyDisc = UIImageView( image : UIImage(named : "BattleBackdrop") )
        return imageViewEnemyDisc
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
        imageViewBattleBackDrop.frame = CGRect(
            x : 0
            , y : 0
            , width : frame.size.width
            , height : frame.size.height
        )
        
        imageViewAlyDisc.frame = CGRect(
            x : 0
            , y : frame.size.height - 100
            , width : 300
            , height : 100
        )
        
        imageViewEnemyDisc.frame = CGRect(
            x : frame.size.width - 270
            , y : 62.5
            , width : 270
            , height : 90
        )
        
        imageViewAly.frame = CGRect(
            x : imageViewAlyDisc.frame.maxX/4
            , y : frame.size.height - 150
            , width : 150
            , height : 150
        )
        
        imageViewEnemy.frame = CGRect(
            x : frame.size.width - 150 - (imageViewEnemyDisc.frame.maxX/8)
            , y : 62.5 - (90/2)
            , width: 125
            , height: 125
        )
        
        addSubview(imageViewBattleBackDrop)
        addSubview(imageViewAlyDisc)
        addSubview(imageViewEnemyDisc)
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
    }}
