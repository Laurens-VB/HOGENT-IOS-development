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
        
        //Aanmaken & instellen van de task, taak die we met het request wensen uit te voeren:
        
        var pokemon : Pokemon = Pokemon(name : "")
        
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
                let decodedPokemonData = try JSONDecoder().decode(Pokemon.self , from: data)
                
                pokemon = Pokemon (
                    name : decodedPokemonData.name
                )
            }
            catch
            {
                print(error)
            }
        }
        
        //Task uitvoeren
        task.resume()
        
        return pokemon
    }
    
    func genneratePokémon(amount : Int) throws ->  [Pokemon]
    {
        var pokemons : [Pokemon] = [Pokemon]()
        
        for _ in 1...amount
        {
            //Random getal genereren tussen 1 en 898, 1 included, 898 included
            //TO CHECK!
            try pokemons.append(requestPokémon( entry :  Int.random(in: 1...898 ) ) )
        }
        
        return pokemons
    }
}
