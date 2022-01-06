//
//  PokemonSelectionView.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 06/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import UIKit

class PokemonSelectionView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var amount : Int = 3
    var imageViews : [UIImageView] = []
    
    override init(frame : CGRect)
    {
        super.init(frame : frame)
        backgroundColor = .cyan
        
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getAmount() -> Int
    {
        return amount
    }
    
    func setAmount(amount : Int) -> Void
    {
        self.amount = amount
    }
    
    func generateButtons() -> Void
    {
        print("Generate Buttons Called!")
        
        var isOneven : Bool = true
        var yMultiplier : Int = 1
        
        var pokemons : [Pokemon]?
        
        let pokemonGenerator : PokemonGenerator = PokemonGenerator()
        
        do {
            pokemons = try pokemonGenerator.genneratePokémons(amount : self.amount)
        } catch is Error {  }
        
        
        
        //buttons = [UIButton, UIButton, UIButton, UIButton, UIButton, UIButton]
        for index in 1...self.amount
        {
            let pokemonSpriteHelper : PokemonSpriteHelper = PokemonSpriteHelper()
            let imageView : UIImageView =
            {
                var imageView = UIImageView()
                do
                {
                    try imageView = pokemonSpriteHelper.setImage(from : pokemons![index-1].sprites!.front_default!)!
                }
                catch is Error { }
                imageView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
                imageView.layer.borderWidth = 2
                imageView.layer.cornerRadius = 20
                imageView.layer.masksToBounds = true
                imageView.contentMode = .scaleToFill
                
            return imageView
            }()
            
            if isOneven
            {
                imageView.frame = CGRect(
                    x : (Int(frame.size.width)/4) - (95/2)
                    , y : (Int(frame.size.width)/3) * yMultiplier - (95/2)
                    , width: 95
                    , height: 95
                )
                isOneven = false
            }
            else
            {
                imageView.frame = CGRect(
                    x : (Int(frame.size.width)/4)*3 - (95/2)
                    , y : (Int(frame.size.width)/3) * yMultiplier - (95/2)
                    , width: 95
                    , height: 95
                )
                isOneven = true
                //Iedere keer als we van oneven false naar true gaan, moet de y multiplier met 1 vermeerderen!
                yMultiplier = yMultiplier + 1
            }
            
            addSubview(imageView)
            imageViews.append(imageView)
        }
    }
    
    func getImageViews() -> [UIImageView]
    {
        return imageViews
    }
}
