//
//  PokemonMoveDetails.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 09/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import Foundation


class PokemonMoveDetails
{
    init() {}
    
    private func requestMoveDetails(moveName : String) throws -> MoveDetail
    {
        /*
         guard statement, dient om te kijken of de expressie URL(...) kan uitgevoert worden:
         Indien guard = true, URL(...) kan uitgevoert worden
         Indien guard = false, URL(...) kan niet uitgevoert worden, en dan wordt er een exception geworpen
         */
        
        guard let url = URL(string : "https://pokeapi.co/api/v2/move/\(moveName)") else
        {
            throw fatalError("pokémon Move API kon niet correct gelezen worden")
        }
        
        //Aanmaken request, met de zonet aangemaakte url
        var request = URLRequest(url : url)
        
        //Instellen request:
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField : "Content-Type")
        
        var move : MoveDetail = MoveDetail(
            name: ""
            , accuracy: 0
            , power: 0
            , type: Type.init(name: "")
        )
        
            /*= Pokemon(
            name : ""
            , sprites : Pokemon.Sprites(back_default: "", front_default: "")
            //, stats : Pokemon.Stats(base_stat: 1)
            //, moves : [Pokemon.Moves(move: Pokemon.Moves.Move(name : ""))]
            , moves: [Moves]()
        )*/
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
                print("pain")
                move = try JSONDecoder().decode(MoveDetail.self , from: data)
                print(move)
                
            }
            catch
            {
                print(error)
            }
        }
        
        task.resume()
        repeat { } while move.name == ""
        
        if(move.accuracy == nil)
        {
            move.accuracy = Int.random(in: 50...100)
            
        }
        
        if(move.power == nil)
        {
            move.power = Int.random(in: 50...100)
        }
        
        return move
    }
    
    func getMoveDetails(moveName : String) -> MoveDetail?
    {
        var moveDetail : MoveDetail
        do
        {
            return try requestMoveDetails(moveName: moveName)
        }
        catch is Error { }
        return nil
    }
}
