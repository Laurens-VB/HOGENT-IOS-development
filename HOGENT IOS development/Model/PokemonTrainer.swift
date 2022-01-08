//
//  BattleTower.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 08/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import Foundation

class PokemonTrainer
{
    var team : [Pokemon]
    
    init(team : [Pokemon])
    {
        self.team = team
    }
    
    func getTeam() -> [Pokemon]
    {
        return team
    }
}
