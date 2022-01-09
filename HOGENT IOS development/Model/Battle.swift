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
    
    private let pokemonMoveDetailsHelper : PokemonMoveDetails = PokemonMoveDetails()
    
    private var alyFainted : Bool = false
    private var enemyFainted : Bool = false
    
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
        
        print("zaiuozaiupjbzaiubnzabpiyuzauipâz")
        print(self.alyTeam)
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
    
    func getAlyFainted() -> Bool
    {
        return alyFainted
    }
    
    func getEnemyFainted() -> Bool
    {
        return enemyFainted
    }
    
    func falsifyAlyFainted() -> Void
    {
        alyFainted = false
    }
    
    func falsifyEnemyFainted() -> Void
    {
        enemyFainted = false
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
    
    func turn(alyPokemon : Pokemon
        , alyMove : MoveDetail ) -> Void
    {
        print("Turn Started")
        
        var enemyPokemon = enemyTeam[0]
        
        let enemyMove = pokemonMoveDetailsHelper.getMoveDetails(moveName :    (enemyPokemon.moves?.shuffled()[0].move?.name)!)
        
        print("Aly Team: ")
        print(alyTeam[0].stats![0].base_stat)
        
        print("Enemy Team: ")
        print(enemyTeam[0].stats![0].base_stat)
        
        // ?? is voor default value, want we werken met Int?
        if (getSPEEDStat(pokemon : alyPokemon).base_stat ?? 0 > getSPEEDStat(pokemon: enemyPokemon).base_stat ?? 0)
            //ALLY is sneller
        {
            var damage = calculateDamage(damagingPokemon: alyPokemon
                , damagingMove: alyMove
                , receivingPokemon: enemyPokemon)
            
            print("damage on enemy")
            print(damage)
            
            enemyTeam[0] = inflictDamage(pokemon: enemyPokemon, damageTaken: damage)
            
            print("HP ENEMY")
            print(getHPStat(pokemon: enemyTeam[0]).base_stat!)
            
            if( getHPStat(pokemon: enemyTeam[0]).base_stat! <= 0)
            {
                print("enemy ded")
                enemyTeam.removeFirst()
                enemyFainted = true
            }
            
            //Als enemy nog leeft!
            if !enemyFainted
            {
                damage = calculateDamage(damagingPokemon: enemyPokemon
                    , damagingMove: enemyMove!
                    , receivingPokemon: alyPokemon)
                
                print("damage on aly")
                print(damage)
                
                alyTeam[0] = inflictDamage(pokemon: alyPokemon, damageTaken: damage)

                if( getHPStat(pokemon: alyTeam[0]).base_stat! <= 0)
                {
                    print("Aly fainted")
                    alyTeam.removeFirst()
                    alyFainted = true
                }
            }
        }
        
        if (getSPEEDStat(pokemon : enemyPokemon).base_stat ?? 0 > getSPEEDStat(pokemon : alyPokemon).base_stat ?? 0
            || getSPEEDStat(pokemon : enemyPokemon).base_stat ?? 0 == getSPEEDStat(pokemon : alyPokemon).base_stat ?? 0)
            //ENEMY is sneller
        {
            var damage = calculateDamage(damagingPokemon: enemyPokemon
                , damagingMove: enemyMove!
                , receivingPokemon: alyPokemon)
            
            print("damage on aly")
            print(damage)
            
            alyTeam[0] = inflictDamage(pokemon: alyPokemon, damageTaken: damage)
            
            if !( (getHPStat(pokemon: alyTeam[0] ).base_stat!) > 0)
            {
                print("ALY FAINTED!")
                alyTeam.removeFirst()
                alyFainted = true
            }
            
            if !alyFainted
            {
                damage = calculateDamage(damagingPokemon: alyPokemon
                    , damagingMove: alyMove
                    , receivingPokemon: enemyPokemon)
                
                print("damage on enemy")
                print(damage)
                
                enemyTeam[0] = inflictDamage(pokemon: enemyPokemon, damageTaken: damage)
                
                print("HP ENEMY")
                print(getHPStat(pokemon: enemyTeam[0]).base_stat!)
                
                if !( (getHPStat(pokemon: enemyTeam[0]).base_stat!) > 0)
                {
                    print("ENEMY FAINTED!")
                    enemyTeam.removeFirst()
                    enemyFainted = true
                }
            }
        }
    }
    
    func calculateDamage(damagingPokemon : Pokemon
        , damagingMove: MoveDetail
        , receivingPokemon : Pokemon) -> Int
    {
        return 50
    }
    
    func inflictDamage(pokemon : Pokemon, damageTaken : Int) -> Pokemon
    {
        var pokemon = pokemon
        
        // 0 is de HP stat
        var hpStat = getHPStat(pokemon: pokemon)
        hpStat.base_stat = hpStat.base_stat! - damageTaken
        pokemon.stats![0] = hpStat
        return pokemon
        
    }
    
    func getHPStat(pokemon : Pokemon) -> Stats
    {
        return pokemon.stats![0]
    }
    
    func getSPEEDStat(pokemon : Pokemon) -> Stats
    {
        return pokemon.stats![5]
    }
    
    func isWinner() -> Bool?
    {
        if enemyTeam.count == 0 || alyTeam.count == 0
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func didYouWin() -> Bool
    {
        if enemyTeam.count == 0
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    
    
    
}
