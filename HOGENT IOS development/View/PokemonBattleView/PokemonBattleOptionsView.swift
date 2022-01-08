//
//  PokemonBattleOptionsView.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 06/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import UIKit

class PokemonBattleOptionsView: UIView
{
    var buttonMoves : [UIButton] = []
    
    override init(frame : CGRect)
    {
        super.init(frame : frame)
        backgroundColor = .purple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews()
    {
        generateMoveButtons()
    }
    
    func generateMoveButtons() -> Void
    {
        
        print(frame.size.width)
        var isOneven : Bool = true
        var yMultiplier : Int = 1
        //buttons = [UIButton, UIButton, UIButton, UIButton, UIButton, UIButton]
        for index in 1...4
        {
            let buttonMove : UIButton =
            {
                let buttonMove = UIButton()
                buttonMove.backgroundColor = .systemGreen
                buttonMove.setTitle("MOVE", for : .normal)
                return buttonMove
                
            }()
            
            if isOneven
            {
                buttonMove.frame = CGRect(
                    x : (Int(frame.size.width)/4) - (120/2)
                    , y : (Int(frame.size.height)/4) * yMultiplier - 50
                    , width: 120
                    , height: 50
                )
                isOneven = false
            }
            else
            {
                buttonMove.frame = CGRect(
                    x : (Int(frame.size.width)/4)*3 - (120/2)
                    , y : (Int(frame.size.height)/4) * yMultiplier - 50
                    , width: 120
                    , height: 50
                )
                isOneven = true
                //Iedere keer als we van oneven false naar true gaan, moet de y multiplier met 1 vermeerderen!
                yMultiplier = yMultiplier + 1
            }
            
            addSubview(buttonMove)
            buttonMoves.append(buttonMove)
        }
    }
}
