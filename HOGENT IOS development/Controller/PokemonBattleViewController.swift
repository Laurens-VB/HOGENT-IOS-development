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
    var pokemonBattleView : PokemonBattleView? = nil
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        
        print("KOELEKEKOEEE")
    }
}

//Extension op de PokemonBattleViewController die de PokemonSelectionViewControllerDelegate implementeerd
extension PokemonBattleViewController : PokemonSelectionViewControllerDelegate
{
    func highlighted(selection: [Pokemon])
    {
        var moves : [String] = [String]()
        for move in selection[0].moves!
        {
            moves.append((move.move?.name)!)
        }
        
        pokemonBattleView = PokemonBattleView (
               frame: CGRect(
                   x : 0
                   , y : 0
                   , width : UIScreen.main.bounds.width
                   , height : UIScreen.main.bounds.height
               )
               ,moveNames : moves
           )
        
        print("EINDELIJK VIVA ESPAGNA!!!")
        var index = 0
        for button in pokemonBattleView?.pokemonBattleOptions.getButtonMoves() ?? []
        {
            let tapGesture = MoveTappedRecognizer(target: self, action : #selector(buttonMovePressed(sender:)))
            
            tapGesture.index = index
            
            button.addGestureRecognizer(tapGesture)
            
            index = index+1
        }
        
        pokemonBattleView!.pokemonBattleScene.setImagePokemonAly(URL: (selection[0].sprites?.back_default)!)
        
        
        view.addSubview(pokemonBattleView!)
        
        
    }
    
    @objc func buttonMovePressed(sender: MoveTappedRecognizer)
    {
        print(sender.index!)
    }
    
    
    
    
    class MoveTappedRecognizer : UITapGestureRecognizer {
        var index: Int?
    }}
