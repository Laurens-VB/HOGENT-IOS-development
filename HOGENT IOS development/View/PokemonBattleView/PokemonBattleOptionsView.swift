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
    var moveNames : [String] = []
    
    var buttonMoves : [UIButton] = []
    
    init(frame : CGRect, moveNames : [String])
    {
        super.init(frame : frame)
        backgroundColor = UIColor(red : 53/255, green : 56/255, blue : 54/255, alpha : 1)
        self.moveNames = moveNames
        
        for moveName in moveNames
        {
            print(moveName)
            let buttonMove : UIButton =
            {
                let buttonMove = UIButton()
                buttonMove.backgroundColor = .systemGreen
                buttonMove.setTitle(moveName, for : .normal)
                return buttonMove
                
            }()
            buttonMoves.append(buttonMove)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews()
    {
        generateMoveButtons()
        for buttonMove in buttonMoves
        {
            addSubview(buttonMove)
        }
    }
    
    func generateMoveButtons() -> Void
    {
        var isOneven : Bool = true
        var yMultiplier : Int = 1
        //buttons = [UIButton, UIButton, UIButton, UIButton, UIButton, UIButton]
        for buttonMove in buttonMoves
        {
            buttonMove.titleLabel?.adjustsFontSizeToFitWidth = true
            buttonMove.layer.borderWidth = 2
            buttonMove.layer.borderColor = UIColor.white.cgColor
            buttonMove.layer.cornerRadius = 10
            
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
        }
    }
    
    func getButtonMoves() -> [UIButton]
    {
        return buttonMoves
    }
    
    func clearButtons()
    {
        //Clear buttons als we er hebben
        if buttonMoves.count != 0
        {
            print("clearing buttons!")
            
            for index in 0...buttonMoves.count-1
            {
                let buttonMove : UIButton = UIButton()
                buttonMoves[index] = buttonMove
            }
            
            layoutSubviews()
            
            print("buttons should be cleared!")
        }
    }

    func rebuildButtons(moves : [String])
    {
        print("rebuilding buttons")
        print(buttonMoves[0].currentTitle)

        for (index, move) in moves.enumerated()
        {
            buttonMoves[index].setTitle(move, for: .normal)
        }
        
        print(buttonMoves[0].currentTitle)
        
        layoutSubviews()
    }
}
