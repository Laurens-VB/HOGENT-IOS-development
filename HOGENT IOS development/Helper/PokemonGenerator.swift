//
//  PokemonGenerator.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 04/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import Foundation

class PokemonGenerator
{
    var pokemons : [Pokemon] = [Pokemon]()
    
    init() {}
    
    private func requestPokémon(entry : Int) throws -> Pokemon
    {        
        /*
         guard statement, dient om te kijken of de expressie URL(...) kan uitgevoert worden:
         Indien guard = true, URL(...) kan uitgevoert worden
         Indien guard = false, URL(...) kan niet uitgevoert worden, en dan wordt er een exception geworpen
         */
        
        guard let url = URL(string : "https://pokeapi.co/api/v2//pokemon/\(entry)") else
        {
            throw fatalError("pokémon API kon niet correct gelezen worden")
        }
        
        //Aanmaken request, met de zonet aangemaakte url
        var request = URLRequest(url : url)
        
        //Instellen request:
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField : "Content-Type")
        
        var pokemon : Pokemon = Pokemon(
            name : ""
            , sprites : Sprites(back_default: "", front_default: "")
            , stats : [Stats]()
            //, moves : [Pokemon.Moves(move: Pokemon.Moves.Move(name : ""))]
            , moves: [Moves]()
        )
        
        //Aanmaken & instellen van de task, taak die we met het request wensen uit te voeren:
        let task = URLSession.shared.dataTask(with: request)
        { data, _, error in
            //In deze guard wordt de data die we binnen krijgen toegewezen aan de var data, en wordt gekeken of er geen errors zijn
            guard let data = data, error == nil else
            //Uitvoeren bij error:
            {
                return
            }
            do
            {
                //Uitroepteken dient om de ontvangen data te unwrappen!
                pokemon = try JSONDecoder().decode(Pokemon.self , from: data)
                //print(pokemon)
                
            }
            catch
            {
                print(error)
            }
        }
        
        task.resume()
        
        //Temp solution om resume() te stallen tot wanneer de data is opgevraagt!
        repeat { } while pokemon.name == ""
        return pokemon
    }
    
    func genneratePokémons(amount : Int) throws ->  [Pokemon]
    {
        for _ in 1...amount
        {
            //Random getal genereren tussen 1 en 649
            do
            {
                var entry = Int.random(in: 1...649)
                var pokemon = try requestPokémon( entry :  entry)
                repeat
                {
                    entry = Int.random(in: 1...649)
                    pokemon = try requestPokémon( entry :  entry )
                }
                while( pokemon.sprites?.front_default == nil || pokemon.sprites?.back_default == nil )
                
                pokemons.append(pokemon)
                
            } catch is Error { }
        }
        print(pokemons.count)
        
        pickRandomMoves(amount: 4)
        return pokemons
    }
    
    func pickRandomMoves(amount : Int)
    {
        for (index, pokemon) in pokemons.enumerated()
        {
            print(pokemon.moves?.count)
            var moves : [Moves] = [Moves]()
            /*for _ in 1...4
            {
                if(pokemon.moves!.count < 4)
                {
                    do
                    {
                        pokemons[index] = try genneratePokémons(amount : 1)[0]
                    }
                    catch is Error {}
                }*/
            
            for i in 1...amount
            {
                if pokemon.moves!.count > 0
                {
                    var moveNumber = Int.random(in: 0...pokemon.moves!.count-1)
                    moves.append(pokemon.moves![moveNumber])
                    
                    
                    
                }
            }
            pokemons[index].moves = moves
        }
    }
}
