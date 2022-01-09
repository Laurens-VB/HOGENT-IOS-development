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
    var battle : Battle? = nil
    
    var pokemonBattleView : PokemonBattleView? = nil
    
    let pokemonMoveDetailsHelper : PokemonMoveDetails = PokemonMoveDetails()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("KOELEKEKOEEE")
    }
    
    func getMoveDetail(idMove : Int) -> MoveDetail
    {
        let clickedButton = pokemonBattleView?.pokemonBattleOptions.buttonMoves[idMove]
        return pokemonMoveDetailsHelper.getMoveDetails(moveName: (clickedButton?.currentTitle)!)!
    }
    
    func colorMove(moveDetail : MoveDetail) -> UIColor
    {
        let pokemonMoveHelperUX : PokemonMoveHelperUX = PokemonMoveHelperUX()
        return pokemonMoveHelperUX.determineLayout(type: moveDetail.type!.name)
    }
}

//Extension op de PokemonBattleViewController die de PokemonSelectionViewControllerDelegate implementeerd
extension PokemonBattleViewController : PokemonSelectionViewControllerDelegate
{
    func highlighted(selection: [Pokemon]) -> Void
    {
        createBattle(alyTeam : selection)
        battle?.shuffleTeams()
        
        generateMoveButtons(selection: (battle?.getAlyTeam())!)
        generateSprites(selection: selection)
        
        view.addSubview(pokemonBattleView!)
    }
    
    func createBattle(alyTeam : [Pokemon]) -> Void
    {
        self.battle = Battle(alyTeam : alyTeam)
    }
    
    func generateMoveButtons(selection : [Pokemon]) -> Void
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
        
        var index = 0
        for button in pokemonBattleView?.pokemonBattleOptions.getButtonMoves() ?? []
        {
            let moveDetail : MoveDetail = pokemonMoveDetailsHelper.getMoveDetails(moveName : button.currentTitle!)!
            
            button.backgroundColor = colorMove(moveDetail : moveDetail)
            
            let tapGesture = MoveTappedRecognizer(target: self, action : #selector(buttonMovePressed(sender:)))
            
            tapGesture.index = index
            
            button.addGestureRecognizer(tapGesture)
            
            index = index+1
        }
    }
    
    func generateSprites(selection : [Pokemon]) -> Void
    {
        pokemonBattleView!.pokemonBattleScene.setImagePokemonAly(URL: (selection[0].sprites?.back_default)!)
    }
    
    @objc func buttonMovePressed(sender: MoveTappedRecognizer)
    {
        print(getMoveDetail(idMove: sender.index!))
    }
    
    class MoveTappedRecognizer : UITapGestureRecognizer
    {
        var index: Int?
    }
}
