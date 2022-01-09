//
//  PokemonBattleViewController.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 06/01/2022
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import UIKit


protocol PokemonBattleViewControllerDelegate : class
{
    func isGewonnen(isGewonnen : Bool )
}
class PokemonBattleViewController: UIViewController
{
    weak var delegate : PokemonBattleViewControllerDelegate?

    var battle : Battle? = nil
    
    var pokemonBattleView : PokemonBattleView? = nil
    
    let pokemonMoveDetailsHelper : PokemonMoveDetails = PokemonMoveDetails()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
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
    func highlighted(selection: [Pokemon], imageViews : [UIImageView]) -> Void
    {
        createBattle(alyTeam: selection)
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
        
        print(selection?.count)
        
        
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
            , moveNames : moves
            , naamAly : selection![0].name
            , naamEnemy: (battle?.getEnemyTeam()[0].name)!
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
    
    func updateHP() -> Void
    {
        pokemonBattleView?.pokemonBattleScene.alyStatusView.updateHPBar(currentHP: (battle?.getAlyTeam()[0].stats?[0].base_stat)!
            , baseHP: (battle?.getConstAlyTeam()[0].stats?[0].base_stat)!)
        
        pokemonBattleView?.pokemonBattleScene.enemyStatusView.updateHPBar(currentHP: (battle?.getEnemyTeam()[0].stats?[0].base_stat)!
        , baseHP: (battle?.getConstEnemyTeam()[0].stats?[0].base_stat)!)
    }
    
    func renewStatusBar(isAly : Bool) -> Void
    {
        var naam : String? = nil
        
        if isAly
        {
            naam = battle?.getAlyTeam()[0].name
        }
        else
        {
            naam = battle?.getEnemyTeam()[0].name
            
        }
        
        pokemonBattleView?.pokemonBattleScene.newStatusView(
            naam : naam!
            , isAlly: isAly)
    }
    
    func turnUI() -> Void
    {
        if battle?.isWinner() == false
        {
            updateHP()
            
            if ( (battle?.getAlyFainted())! || (battle?.getEnemyFainted())! )
            {
                generateSprites()
                remakeButtons()
            }
            
            if (battle?.getAlyFainted())!
            {
                renewStatusBar(isAly: true)
            }
            else
            {
                renewStatusBar(isAly: false)
            }
                
            
            
        }
        else
        {

            
            let launchViewController = LaunchViewController()
            
            delegate = launchViewController.self
            
            self.dismiss(animated: true, completion: nil)
            
            delegate!.isGewonnen(isGewonnen: (battle?.didYouWin())!)
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
