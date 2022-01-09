///
//  PokemonSelectionView.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 06/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//
import UIKit

// = Wordt gebruikt als LaunchView
class PokemonSelectionView: UIView
{
    
    var amount : Int = 3
    var imageViews : [UIImageView] = [UIImageView]()
    
    let buttonConfirm : UIButton =
    {
        let buttonConfirm = UIButton()
        buttonConfirm.backgroundColor = UIColor(red : 120/255 , green : 125/255, blue : 120/255, alpha : 1)
        buttonConfirm.isEnabled = false
        buttonConfirm.setTitle("Confirm Selection", for : .normal)
        return buttonConfirm
    }()
    
    let buttonReroll : UIButton =
    {
        let buttonReroll = UIButton()
        buttonReroll.backgroundColor = .systemRed
        buttonReroll.setTitle("Reroll Pokémon", for : .normal)
        return buttonReroll
    }()
    
    init(frame : CGRect, URLs : [String] )
    {
        super.init(frame : frame)
        backgroundColor = UIColor(red : 53/255, green : 56/255, blue : 54/255, alpha : 1)
        
        let pokemonSpriteHelper : PokemonSpriteHelper = PokemonSpriteHelper()
        for URL in URLs
        {
            print(URL)
            let pokemonImageView : UIImageView =
            {
                var pokemonImageview = UIImageView()
                do
                {
                    try pokemonImageview = pokemonSpriteHelper.setImage(from : URL)!
                }
                catch is Error { }
                return pokemonImageview
            }()
            imageViews.append(pokemonImageView)
        }
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func generateImages() -> Void
    {
        var images : [UIImageView] = [UIImageView]()
        var isOneven : Bool = true
        var yMultiplier : Int = 1
        
        for imageView in imageViews
        {

            imageView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
            imageView.layer.borderWidth = 2
            imageView.layer.cornerRadius = 20
            imageView.layer.masksToBounds = true
            imageView.contentMode = .scaleToFill
            imageView.backgroundColor = UIColor(red : 164/255, green : 176/255, blue : 171/255, alpha : 1)
            
            if isOneven
            {
                imageView.frame = CGRect(
                    x : (Int(frame.size.width)/4) - (95/2)
                    , y : (Int(frame.size.height)/6) * yMultiplier - (95/2)
                    , width: 95
                    , height: 95
                )
                isOneven = false
            }
            else
            {
                imageView.frame = CGRect(
                    x : (Int(frame.size.width)/4)*3 - (95/2)
                    , y : (Int(frame.size.height)/6) * yMultiplier - (95/2)
                    , width: 95
                    , height: 95
                )
                isOneven = true
                //Iedere keer als we van oneven false naar true gaan, moet de y multiplier met 1 vermeerderen!
                yMultiplier = yMultiplier + 1
            }
        }
    }
    
    override func layoutSubviews()
    {
        generateImages()
        for imageView in imageViews
        {
            addSubview(imageView)
        }
        
        buttonConfirm.frame = CGRect(
            x: (Int(frame.size.width)/2) - (200/2)
            , y : (Int(frame.size.height)/4)*3 - (50/2)
            , width: 200
            , height: 50
        )
        
        buttonConfirm.layer.borderWidth = 2
        buttonConfirm.layer.cornerRadius = 20
        buttonConfirm.layer.masksToBounds = true
        
        addSubview(buttonConfirm)
        
        buttonReroll.frame = CGRect(
            x: (Int(frame.size.width)/2) - (200/2)
            , y : Int(buttonConfirm.frame.maxY + 20)
            , width: 200
            , height: 50
        )
        
        addSubview(buttonReroll)
        
        buttonReroll.layer.borderWidth = 2
        buttonReroll.layer.cornerRadius = 20
        buttonReroll.layer.masksToBounds = true
    }
    
    func getAmount() -> Int
    {
        return amount
    }
    
    func setAmount(amount : Int) -> Void
    {
        self.amount = amount
    }
    
    func getImageViews() -> [UIImageView]
    {
        return imageViews
    }
    
    func unlockConfirmButton() -> Void
    {
        buttonConfirm.isEnabled = true
        buttonConfirm.backgroundColor = UIColor.systemGreen
    }
    
    func lockConfirmButton() -> Void
    {
        buttonConfirm.isEnabled = false
        buttonConfirm.backgroundColor = UIColor(red : 120/255 , green : 125/255, blue : 120/255, alpha : 1)
    }
    
    func reroll(URLs : [String] )
    {
        print(imageViews.count)
        imageViews = [UIImageView]()
        print(imageViews.count)
        let pokemonSpriteHelper : PokemonSpriteHelper = PokemonSpriteHelper()

        for URL in URLs
        {
            print(URL)
            let pokemonImageView : UIImageView =
            {
                var pokemonImageview = UIImageView()
                do
                {
                    try pokemonImageview = pokemonSpriteHelper.setImage(from : URL)!
                }
                catch is Error { }
                return pokemonImageview
            }()
            imageViews.append(pokemonImageView)
        }
        print(imageViews.count)
        layoutSubviews()
    }
}
