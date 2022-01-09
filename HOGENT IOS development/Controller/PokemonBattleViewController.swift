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
        generateMoveButtons()
        generateSprites()
        
        view.addSubview(pokemonBattleView!)
    }
    
    func createBattle(alyTeam : [Pokemon]) -> Void
    {
        self.battle = Battle(alyTeam : alyTeam)
    }
    
    func generateMoveButtons() -> Void
    {
        var selection = battle?.getAlyTeam()
        
        var moves : [String] = [String]()
        for move in selection![0].moves!
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
    
    func generateSprites() -> Void
    {
        pokemonBattleView!.pokemonBattleScene.clearImages()
        
        print("ALLY pokemonUDA:")
        print(battle?.getAlyTeam()[0].name)
        
        pokemonBattleView!.pokemonBattleScene.setImagePokemonAly(URL: (battle?.getAlyTeam()[0].sprites?.back_default)!)
        
        print("ENEMY pokemonUDA:")
        print(battle?.getEnemyTeam()[0].name)
        
        pokemonBattleView!.pokemonBattleScene.setImagePokemonEnemy(URL: (battle?.getEnemyTeam()[0].sprites?.front_default)!)
    }
    
    /*
    func clearButtons()
    {
        //Clear buttons als we er hebben
        if pokemonBattleView?.pokemonBattleOptions.buttonMoves.count != 0
        {
            print("clearing buttons!")
            
            for index in 0...(pokemonBattleView?.pokemonBattleOptions.buttonMoves.count)!-1
            {
                let buttonMove : UIButton = UIButton()
                pokemonBattleView?.pokemonBattleOptions.buttonMoves[index] = buttonMove
            }
            
            pokemonBattleView?.pokemonBattleOptions.layoutSubviews()
            
            print("buttons should be cleared!")
        }
    }
    
    func rebuildButtons()
    {
        print("rebuilding buttons")
        print(pokemonBattleView?.pokemonBattleOptions.buttonMoves[0].currentTitle)
        
        var selection = battle?.getAlyTeam()
        
        var moves : [String] = [String]()
        for move in selection![0].moves!
        {
            moves.append((move.move?.name)!)
        }
        
        for (index, move) in moves.enumerated()
        {
            pokemonBattleView?.pokemonBattleOptions.buttonMoves[index].setTitle(move, for: .normal)
        }
        
        print(pokemonBattleView?.pokemonBattleOptions.buttonMoves[0].currentTitle)
        
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
        
        pokemonBattleView?.pokemonBattleOptions.layoutSubviews()
        
    }
 
 */
    func remakeButtons()
    {
        pokemonBattleView?.pokemonBattleOptions.clearButtons()
        
        print("rebuilding buttons")
        
        var selection = battle?.getAlyTeam()
        
        var moves : [String] = [String]()
        for move in selection![0].moves!
        {
            moves.append((move.move?.name)!)
        }
        
        pokemonBattleView?.pokemonBattleOptions.rebuildButtons(moves: moves)
        
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
    func turnUI() -> Void
    {
        print("TURNUI")
        
        if ( (battle?.getAlyFainted())! || (battle?.getEnemyFainted())! )
        {
            print("JOINK JOINK JOINK SOME1 FAINTED")
            generateSprites()
            
            remakeButtons()
            
            //clearButtons()
            //rebuildButtons()
        }
    }
    
    @objc func buttonMovePressed(sender: MoveTappedRecognizer)
    {
        battle?.turn(alyPokemon: (battle?.getAlyTeam()[0])!
            , alyMove: getMoveDetail(idMove: sender.index!))
        turnUI()
    }
    
    class MoveTappedRecognizer : UITapGestureRecognizer
    {
        var index: Int?
    }
}
