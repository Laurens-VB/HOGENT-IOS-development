//
//  Battle.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 08/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import Foundation

class Battle
{
    private let constAlyTeam : [Pokemon]
    private let constEnemyTeam : [Pokemon]
    
    private var alyTeam : [Pokemon]
    private var enemyTeam : [Pokemon]

    init(alyTeam : [Pokemon])
    {
        let pokemonGeneratorHelper : PokemonGenerator = PokemonGenerator()
        var enemyTeam : [Pokemon]? = nil
        do
        {
             enemyTeam = try pokemonGeneratorHelper.genneratePokémons(amount: 3)
        }
        catch is Error { }
        
        self.constAlyTeam = alyTeam
        self.constEnemyTeam = enemyTeam!
        self.alyTeam = alyTeam
        self.enemyTeam = enemyTeam!
    }
    
    func getConstAlyTeam() -> [Pokemon]
    {
        return constAlyTeam
    }
    
    func getConstEnemyTeam() -> [Pokemon]
    {
        return constEnemyTeam
    }
    
    func getAlyTeam() -> [Pokemon]
    {
        return alyTeam
    }
    
    func getEnemyTeam() -> [Pokemon]
    {
        return enemyTeam
    }
    
    func shuffleTeams() -> Void
    {
        print(alyTeam)
        self.alyTeam = alyTeam.shuffled()
        print(alyTeam)
        self.enemyTeam = enemyTeam.shuffled()
    }
    
    
    func start() -> Void
    {
            //Not Yet implemented
    }
    
    func turn() -> Void
    {
        //not yet implemented
    }
    
    
    
}
