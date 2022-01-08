//
//  Team.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 07/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import Foundation

class TeamPicker
{
    let options : [Pokemon]
    
    init()
    {
        let pokemonGenerator : PokemonGenerator = PokemonGenerator()
        var options = [Pokemon]()
        do
        {
            options = try pokemonGenerator.genneratePokémons(amount: 6)
        }
        catch
        {
            print(error)
        }
        self.options = options
    }
    
    func getOptions() -> [Pokemon]
    {
        return options
    }
    
    /*func chooseTeam(selections : [Int]) -> [Pokemon]
    {
        var team : [Pokemon]
        
        for selection in selections
        {
            team.append(options[selection])
        }
        
        return team
    }*/
}
