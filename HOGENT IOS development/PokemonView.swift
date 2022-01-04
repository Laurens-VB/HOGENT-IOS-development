//
//  PokemonView.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 03/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import UIKit

class PokemonView: UIView
{
    //MOET ERGENS EEN VEEL BETERE PLAATS KRIJGEN IS SCHANDALIG DAT DIT HIER STAAT
    var counter = 0
    

    private let imageViewEnemy : UIImageView =
    {
        let imageViewEnemy = UIImageView()
        return imageViewEnemy
    }()
    
    private let imageViewAly : UIImageView =
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
    
    //Volgens https://medium.com/swlh/loading-images-from-url-in-swift-2bf8b9db266
    private func setImage(from url : String, isEnemy : Bool) -> Void
    {
        guard let imageURL = URL(string: url) else { return }

        // just not to cause a deadlock in UI!
        DispatchQueue.global().async
        {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async
            {
                if isEnemy
                {
                    self.imageViewEnemy.image = image
                    
                }
                else
                {
                    self.imageViewAly.image = image
                }
                
            }
        }
    }
    
    func setImagePokemons(pokemons : [Pokemon])
    {
        setImage(from : pokemons[0].sprites.back_default, isEnemy : false)
        setImage(from : pokemons[1].sprites.front_default, isEnemy : true)
        
    }
}
