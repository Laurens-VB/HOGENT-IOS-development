//
//  PokemonBattleStatus.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 09/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import UIKit

class PokemonBattleStatusView : UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let naam : UILabel =
    {
        let naam : UILabel = UILabel()
        return naam
    }()
    
    let HPBar : UILabel =
    {
        let HPBar : UILabel = UILabel()
        HPBar.backgroundColor = UIColor.green
        HPBar.layer.borderColor = UIColor.black.cgColor
        HPBar.layer.borderWidth = 1
        HPBar.layer.cornerRadius = 2
        
        return HPBar
    }()
    
    init(frame : CGRect, naam: String)
    {
        super.init(frame : frame)
        backgroundColor = .white
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 5
        
        self.naam.text = naam
        self.naam.adjustsFontSizeToFitWidth = true
        
        self.naam.frame = CGRect(
            x : 10
            , y : 0
            , width: 50
            , height : 20
        )
        
        HPBar.frame = CGRect(
            x : 10
            , y : 20
            , width : 200-20
            , height : 20
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews()
    {
        addSubview(naam)
        addSubview(HPBar)
    }
    
    func updateHPBar(currentHP : Int, baseHP : Int)
    {
        //Als we currentHP en baseHP niet eerst casten naar een dubbel doet hij een INT deling en komen we altijd 0 of 1 uit!
        var factor : Double = Double(Double(currentHP)/Double(baseHP))
        
        //Voor convenience, wnr HP bar wordt upgedate bij nieuwe pokémon wordt deze groen
        if(factor < 1)
        {
            HPBar.backgroundColor = UIColor.yellow
        }

        if(factor < 0.5)
        {
            HPBar.backgroundColor = UIColor.yellow
        }
        
        if(factor < 0.15)
        {
            HPBar.backgroundColor = UIColor.red
        }

        //Als current HP kleiner is dan 0, current HP op 0 zetten!
        if(factor < 0)
        {
            factor = 0
        }
        
        print(factor)
        
        HPBar.frame = CGRect(
            x : 10
            , y : 20
            , width : (Double(frame.size.width) * (factor)) - 20
            , height : 20
        )
        
        layoutSubviews()
    }
}
